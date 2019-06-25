{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-datamigration
, pyopenssl
}:

buildPythonPackage rec {
  pname = "azure_cli_dms";
  version = "0.1.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0yh7f41pvvkw6lnl629bhis70dnywn8ii2pdff8p0iiwvbl70rdc";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-datamigration
    pyopenssl
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools for the Data Migration Service (DMS) Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
