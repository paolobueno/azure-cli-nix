{ stdenv, buildPythonPackage, fetchPypi, python
, jinja2
, msrest
#, vsts
}:

buildPythonPackage rec {
  pname = "azure_functions_devops_build";
  version = "0.0.22";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "adc4c45de5510acf4c094df84b54bc7767e1466e4bfdce23b99ffccf29de3f2f";
  };

  propagatedBuildInputs = [
    jinja2
    msrest
    #vsts
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Python package for integrating Azure Functions with Azure DevOps. Specifically made for the Azure CLI";
    homepage = https://github.com/Azure/azure-functions-devops-build;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
