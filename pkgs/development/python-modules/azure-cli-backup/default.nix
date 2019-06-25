{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-recoveryservices
, azure-mgmt-recoveryservicesbackup
}:

buildPythonPackage rec {
  pname = "azure_cli_backup";
  version = "1.2.5";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1hm3ma8chlpxw2z6zmw030gyhdcq0biniccs15ms2f6c63wg3bg2";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-recoveryservices
    azure-mgmt-recoveryservicesbackup
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Recovery Services Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
