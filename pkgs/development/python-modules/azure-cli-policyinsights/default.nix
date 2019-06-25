{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-policyinsights
}:

buildPythonPackage rec {
  pname = "azure_cli_policyinsights";
  version = "0.1.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "162d7ar82cs8x481jhwrp9d428ww00l99rlwahmdnxk1q0lk0v6a";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-policyinsights
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Policy Insights Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
