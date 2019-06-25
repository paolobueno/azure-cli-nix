{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-advisor
}:

buildPythonPackage rec {
  pname = "azure_cli_advisor";
  version = "2.0.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0fnq14ir76c4hpfrfzi9sks83fhh73mhj22z7a9sd9ycq8whhwj1";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-advisor
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Advisor Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
