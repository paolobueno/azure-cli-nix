{ stdenv, buildPythonPackage, fetchPypi, python
, azure-common
, azure-mgmt-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_policyinsights";
  version = "0.3.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1jrm5nb03p1cv328bxn06h1ggvcj9fs3sh5919pc7p66c4dq7pzj";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Policy Insights Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
