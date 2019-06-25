{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-storage
, azure-multiapi-storage
}:

buildPythonPackage rec {
  pname = "azure_cli_storage";
  version = "2.4.3";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1y7za4vjc29cr690vjfm7lbc4si48kxd1096slp9cl04dqgcbslg";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-storage
    azure-multiapi-storage
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Storage Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
