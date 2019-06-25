{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_servicebus";
  version = "0.6.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0psc39ir4gp29f8i2y6n38r2mx0zixpwr2yxhm4yz6dsspzjd9xz";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Service Bus Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
