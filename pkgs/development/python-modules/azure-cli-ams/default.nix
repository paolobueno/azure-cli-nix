{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-graphrbac
, azure-mgmt-media
}:

buildPythonPackage rec {
  pname = "azure_cli_ams";
  version = "0.4.7";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "03cm0r4mmhpfcnmd2f667mmjnjr1gkxfp4xp6vhf60h0b03id2g0";
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
    azure-mgmt-media
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools AMS Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
