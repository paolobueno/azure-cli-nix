{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-keyvault
, azure-mgmt-authorization
, azure-mgmt-compute
, azure-mgmt-imagebuilder
, azure-mgmt-keyvault
, azure-mgmt-marketplaceordering
, azure-mgmt-msi
, azure-mgmt-network
, azure-multiapi-storage
}:

buildPythonPackage rec {
  pname = "azure_cli_vm";
  version = "2.2.23";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1s72naw3kacak68igvk5rcsnr144ya1x009p6xsxmzp66v8nqd7w";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-keyvault
    azure-mgmt-authorization
    azure-mgmt-compute
    azure-mgmt-imagebuilder
    azure-mgmt-keyvault
    azure-mgmt-marketplaceordering
    azure-mgmt-msi
    azure-mgmt-network
    azure-multiapi-storage
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools VM Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
