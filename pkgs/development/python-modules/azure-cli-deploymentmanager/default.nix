{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-deploymentmanager
}:

buildPythonPackage rec {
  pname = "azure_cli_deploymentmanager";
  version = "0.1.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0kk1x9shbvanhlvgawiyk88hb5drifa9zlhi1kl0smk90bfyv6hx";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-deploymentmanager
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Deployment Manager Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
