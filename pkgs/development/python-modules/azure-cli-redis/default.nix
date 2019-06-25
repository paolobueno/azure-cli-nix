{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-redis
}:

buildPythonPackage rec {
  pname = "azure_cli_redis";
  version = "0.4.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0dfflmzvjn3snymkxg0pyzhz878sq55zzxl1q6k6kni5vj1cqafz";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-redis
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Redis Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
