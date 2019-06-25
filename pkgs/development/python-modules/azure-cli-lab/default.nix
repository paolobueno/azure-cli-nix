{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-graphrbac
, azure-mgmt-devtestlabs
}:

buildPythonPackage rec {
  pname = "azure_cli_lab";
  version = "0.1.8";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0xf4jcc0331i5yxyjy58yhzxlsff1363y12778j0hc34badfl33c";
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
    azure-mgmt-devtestlabs
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools DevTestLabs Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
