{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-eventgrid
, six
}:

buildPythonPackage rec {
  pname = "azure_cli_eventgrid";
  version = "0.2.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1dr91afylnyzfvx6c5xfp84qyjy103bh5wyligrvfzqanz5cpf1k";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-eventgrid
    six
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools EventGrid Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
