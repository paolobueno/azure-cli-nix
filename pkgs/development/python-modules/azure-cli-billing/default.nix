{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-billing
}:

buildPythonPackage rec {
  pname = "azure_cli_billing";
  version = "0.2.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1fmaq2jcz46aibbr3505kvs4l5rzv3xj60alxmm6pxiz8j1cvcns";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-billing
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Billing Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
