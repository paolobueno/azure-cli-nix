{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-rdbms
, six
}:

buildPythonPackage rec {
  pname = "azure_cli_rdbms";
  version = "0.3.12";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "132lk22kyd5vhsd73bqvanxvaycf08ms9ac7habsm5a658vij54k";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-rdbms
    six
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools MySQL and PostgreSQL Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
