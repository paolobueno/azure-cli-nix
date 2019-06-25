{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-kusto
, six
}:

buildPythonPackage rec {
  pname = "azure_cli_kusto";
  version = "0.2.3";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1vjd1fslj8dhv8skm59k3rpf0na7m7pa5a1fkz4jk7zgkcdjs9pl";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-kusto
    six
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools KUSTO Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
