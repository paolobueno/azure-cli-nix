{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-relay
, six
}:

buildPythonPackage rec {
  pname = "azure_cli_relay";
  version = "0.1.5";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "01dqljwc10ypfx2fdbfql6bki48biqirq6bppdsciy356vwbhj2c";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-relay
    six
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Relay Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
