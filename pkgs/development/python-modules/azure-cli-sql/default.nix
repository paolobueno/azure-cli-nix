{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-sql
, azure-mgmt-storage
, six
}:

buildPythonPackage rec {
  pname = "azure_cli_sql";
  version = "2.2.5";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1pkzhhi96sggrrxn9kc9jc5ifb7pph9d8jkg8d7vh22bj9rdmn4g";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-sql
    azure-mgmt-storage
    six
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools SQL Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
