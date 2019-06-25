{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-datalake-analytics
, azure-mgmt-datalake-store
}:

buildPythonPackage rec {
  pname = "azure_cli_dla";
  version = "0.2.6";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "11ll31fxdry708qspwr4193xnvq3kisidrjxyw9acm9gfcnn95dm";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-datalake-analytics
    azure-mgmt-datalake-store
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Data Lake Analytics Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
