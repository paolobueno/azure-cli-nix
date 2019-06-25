{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
}:

buildPythonPackage rec {
  pname = "azure_cli_cloud";
  version = "2.1.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1m66vdkg7ivkprqci87mmn5lsvxi94q1s91d5wcni24ply6jdw0d";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Cloud Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
