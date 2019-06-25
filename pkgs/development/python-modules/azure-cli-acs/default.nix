{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-graphrbac
, azure-mgmt-authorization
, azure-mgmt-compute
, azure-mgmt-containerservice
, paramiko
, pyyaml
, scp
, six
, sshtunnel
}:

buildPythonPackage rec {
  pname = "azure_cli_acs";
  version = "2.4.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1yk98aip4p1qrdfj8gs6ll6nzwy8xwxdxsbz0zxxg0adcjgvcv6h";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-graphrbac
    azure-mgmt-authorization
    azure-mgmt-compute
    azure-mgmt-containerservice
    paramiko
    pyyaml
    scp
    six
    sshtunnel
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools ACS Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
