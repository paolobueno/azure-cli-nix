{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
}:

buildPythonPackage rec {
  pname = "azure_cli_feedback";
  version = "2.2.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0zyivm5fc4falvzd4p4g4zsz83vjq170gg1z5giz2a4qnww9bkq9";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Feedback Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
