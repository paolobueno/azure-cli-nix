{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-signalr
}:

buildPythonPackage rec {
  pname = "azure_cli_signalr";
  version = "1.0.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "01jwgh2l98rranc5cb9la02s5bbbq0z9qj1cjhvzwhckw78w55rv";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-signalr
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools SignalR Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
