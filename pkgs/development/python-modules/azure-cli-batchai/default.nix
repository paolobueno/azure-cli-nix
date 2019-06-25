{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-batchai
, azure-mgmt-storage
, azure-storage-blob
, mock
, sshtunnel
}:

buildPythonPackage rec {
  pname = "azure_cli_batchai";
  version = "0.4.10";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1dpivg95r160xykkd9kikl1wfbsglab3k666b318xskx1nmsdpl3";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-batchai
    azure-mgmt-storage
    azure-storage-blob
    mock
    sshtunnel
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Batch AI Client Command-Line Tools";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
