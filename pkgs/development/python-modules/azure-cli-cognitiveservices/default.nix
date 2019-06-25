{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-cognitiveservices
}:

buildPythonPackage rec {
  pname = "azure_cli_cognitiveservices";
  version = "0.2.6";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1rg2p7z3ig0nrrwxsphlxjabz2alw4i50awbpmby0k74ync35kdh";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-cognitiveservices
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Cognitive Services Command Module";
    homepage = https://github.com/azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
