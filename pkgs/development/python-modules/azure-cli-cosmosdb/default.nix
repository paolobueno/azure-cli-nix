{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-cosmos
, azure-mgmt-cosmosdb
}:

buildPythonPackage rec {
  pname = "azure_cli_cosmosdb";
  version = "0.2.11";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1mdah4bi257xja1ljxaz4la2qgjs2cb92g3apcqj634j3aabwg2c";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-cosmos
    azure-mgmt-cosmosdb
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Cosmos DB Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
