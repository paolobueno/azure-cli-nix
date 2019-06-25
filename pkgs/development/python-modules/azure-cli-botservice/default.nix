{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-botservice
, azure-mgmt-web
, cryptography
, requests
}:

buildPythonPackage rec {
  pname = "azure_cli_botservice";
  version = "0.2.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0iq48wzamd4gdc3p8wbdv8q2a4hm0xw4v4k276a7gd980hf80skd";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-botservice
    azure-mgmt-web
    cryptography
    requests
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Bot Services Command Module";
    homepage = https://github.com/azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
