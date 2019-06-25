{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-network
}:

buildPythonPackage rec {
  pname = "azure_cli_natgateway";
  version = "0.1.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1j18cl09zm77gr83kig2mn3s1qh33k026xh02b76wgnxq2gfhk0p";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-network
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools NatGateway Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
