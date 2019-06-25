{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-security
}:

buildPythonPackage rec {
  pname = "azure_cli_security";
  version = "0.1.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "18acj0lmkdqadfzg6abxw1y9lgavyh3q603qw60zvnvkdmsmkn52";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-security
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Azure Security Center";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
