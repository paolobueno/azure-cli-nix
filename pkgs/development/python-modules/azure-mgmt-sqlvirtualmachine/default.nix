{ stdenv, buildPythonPackage, fetchPypi, python
, azure-common
, azure-mgmt-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_sqlvirtualmachine";
  version = "0.3.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1670m6d0iwfa1z7xqp505s762hp8g9ia8q8pgr1l2bz8ywp09z4a";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure SQL Virtual Machine Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
