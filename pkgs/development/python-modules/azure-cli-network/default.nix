{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-dns
, azure-mgmt-network
, azure-mgmt-trafficmanager
}:

buildPythonPackage rec {
  pname = "azure_cli_network";
  version = "2.5.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1c9kdqlhdcgjb75f560aq0d7vr2n7lm6if6cg0b5y8vybq66gzdc";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-dns
    azure-mgmt-network
    azure-mgmt-trafficmanager
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Network Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
