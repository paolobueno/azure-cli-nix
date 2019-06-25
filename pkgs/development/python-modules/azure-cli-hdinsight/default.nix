{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-hdinsight
, azure-mgmt-network
, azure-mgmt-storage
}:

buildPythonPackage rec {
  pname = "azure_cli_hdinsight";
  version = "0.3.5";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1w6zwl1xy3wsdfvb0di3z7xi8sgdxv2q9fgzfl82cwn16s9q4qgk";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-hdinsight
    azure-mgmt-network
    azure-mgmt-storage
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools HDInsight Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
