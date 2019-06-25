{ stdenv, buildPythonPackage, fetchPypi, python
, jinja2
, msrest
, vsts
}:

buildPythonPackage rec {
  pname = "azure_functions_devops_build";
  version = "0.0.22";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "";
  };

  propagatedBuildInputs = [
    jinja2
    msrest
    vsts
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Python package for integrating Azure Functions with Azure DevOps. Specifically made for the Azure CLI";
    homepage = https://github.com/Azure/azure-functions-devops-build;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
