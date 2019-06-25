{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-containerregistry
, azure-mgmt-storage
, azure-storage-blob
}:

buildPythonPackage rec {
  pname = "azure_cli_acr";
  version = "2.2.9";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1wxhfsny8jabbgcmrkh7amz1y01xh5llrrbw3llynr5ja8y2mlh5";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-containerregistry
    azure-mgmt-storage
    azure-storage-blob
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools ACR Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
