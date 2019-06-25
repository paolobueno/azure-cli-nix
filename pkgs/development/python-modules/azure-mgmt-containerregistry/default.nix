{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_containerregistry";
  version = "2.8.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1lzc47avccmbppajvkjbyzp3x4xbwp298xj4b0w1yi4vw91cbrvx";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Container Registry Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
