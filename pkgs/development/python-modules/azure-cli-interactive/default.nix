{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, prompt_toolkit
}:

buildPythonPackage rec {
  pname = "azure_cli_interactive";
  version = "0.4.5";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0gpkssmazqakm3xidqz47mjpvr8v4cl4q70vvfjqpgif2f6m2p4v";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    prompt_toolkit
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Interactive Shell";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
