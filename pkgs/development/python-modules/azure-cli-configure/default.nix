{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
}:

buildPythonPackage rec {
  pname = "azure_cli_configure";
  version = "2.0.24";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1bqqybm78233r9wlkcs8r7rqgads1824kclb15zvafdn3ix7zkc5";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Configure Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
