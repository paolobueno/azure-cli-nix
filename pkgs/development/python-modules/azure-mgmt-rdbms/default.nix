{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_rdbms";
  version = "1.8.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1sfiianm0vh84w6slch34qdrj8md7wmzl8xili69l0yqfsk1cy79";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure RDBMS Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
