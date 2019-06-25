{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-consumption
}:

buildPythonPackage rec {
  pname = "azure_cli_consumption";
  version = "0.4.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "06c6czdaqcm8500kjw1hj76bmf2cw4hfh55npq2iyvg8q24cx5ss";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-consumption
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Consumption Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
