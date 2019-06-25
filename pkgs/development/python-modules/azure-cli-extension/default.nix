{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
}:

buildPythonPackage rec {
  pname = "azure-cli-extension";
  version = "0.2.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0gqylazfl0mssy1g2c392bhcwxg3wr36q4xcjpamb0n70p1lpxwl";
  };

  # Hackily force build w/ wheel 0.31
  postPatch = ''
    sed -e '/azure-namespace-package/d' -i  setup.cfg
    sed -e 's/wheel==0.30.0/wheel/' -i setup.py azure_cli_extension.egg-info/requires.txt
  '';

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Extension Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
