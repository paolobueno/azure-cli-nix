{ stdenv, buildPythonPackage, fetchPypi
, applicationinsights
, azure-cli-nspkg
, portalocker
}:

buildPythonPackage rec {
  pname = "azure_cli_telemetry";
  version = "1.0.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0k6yawbncbk6a9kq0hzzjik3v24icsp8wd7y7bhkn6734awyavcl";
  };

  propagatedBuildInputs = [
    applicationinsights
    azure-cli-nspkg
    portalocker
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure CLI Telemetry Package";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
