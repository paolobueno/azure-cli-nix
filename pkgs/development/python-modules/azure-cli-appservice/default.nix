{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-functions-devops-build
, azure-mgmt-applicationinsights
, azure-mgmt-containerregistry
, azure-mgmt-storage
, azure-mgmt-web
, cryptography
, fabric
, pyopenssl
, six
, urllib3
, vsts-cd-manager
, xmltodict
}:

buildPythonPackage rec {
  pname = "azure_cli_appservice";
  version = "0.2.21";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1krzbbqlnfrx80969ldndkf85fqivf7k2l3yq17zmvhh6hkddbv2";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-functions-devops-build
    azure-mgmt-applicationinsights
    azure-mgmt-containerregistry
    azure-mgmt-storage
    azure-mgmt-web
    cryptography
    fabric
    pyopenssl
    six
    urllib3
    vsts-cd-manager
    xmltodict
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools AppService Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
