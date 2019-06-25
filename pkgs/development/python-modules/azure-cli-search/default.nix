{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-search
}:

buildPythonPackage rec {
  pname = "azure_cli_search";
  version = "0.1.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0pkln2a8l27yjqsz8fhb4h04s7nf7ksjfxl84ndyc5ra33n6scm9";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-search
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Search Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
