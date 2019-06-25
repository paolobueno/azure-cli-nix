{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-sqlvirtualmachine
}:

buildPythonPackage rec {
  pname = "azure_cli_sqlvm";
  version = "0.2.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "12c2dhz0bldyapidx6gr4wc5rlcp7bcigcd7gikhqaf7xb9293gs";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-sqlvirtualmachine
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools SQL virtual machine Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
