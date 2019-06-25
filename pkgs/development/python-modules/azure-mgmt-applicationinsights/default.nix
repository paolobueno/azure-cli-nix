{ stdenv, buildPythonPackage, fetchPypi, python
, azure-common
, azure-mgmt-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_applicationinsights";
  version = "0.1.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1pqrbxqq5h5dpr22qx3vxgkrhv06izli2vx39i17viwjjrak174j";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrestazure
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Application Insights Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
