{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_storage";
  version = "3.3.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1gcxhi914v9izzh8xlw1lkmvwmshzxr612knf1hprsjlv3bayhj2";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Storage Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ olcai stesie ];
  };
}
