{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
}:

buildPythonPackage rec {
  pname = "azure_cli_profile";
  version = "2.1.5";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1gqy50crzaqbbwakf3zgnb9qsg652xrkd1rdf4n3rfmpg0qijrdv";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Profile Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
