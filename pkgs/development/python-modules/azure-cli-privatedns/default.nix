{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-network
, azure-mgmt-privatedns
}:

buildPythonPackage rec {
  pname = "azure_cli_privatedns";
  version = "1.0.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0k5jidmwgn8zjyq84jq7jniah4bsi2dssiix8x5sva5z4sfv261a";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-network
    azure-mgmt-privatedns
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Network PrivateDns Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
