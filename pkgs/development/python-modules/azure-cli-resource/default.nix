{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-authorization
, azure-mgmt-managementgroups
}:

buildPythonPackage rec {
  pname = "azure_cli_resource";
  version = "2.1.16";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0b2azl98zr8mxzx5jnasy5h6aj8g7byjqi96cj0afjg3xl3c2cwl";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-authorization
    azure-mgmt-managementgroups
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Resource Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
