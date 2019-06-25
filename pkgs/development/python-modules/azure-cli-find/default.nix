{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
}:

buildPythonPackage rec {
  pname = "azure_cli_find";
  version = "0.3.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1m1v5dylazmgsfcnar0aapbgdbkzdxj9d8zzbbjzkwdpmba7nyl0";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Find Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
