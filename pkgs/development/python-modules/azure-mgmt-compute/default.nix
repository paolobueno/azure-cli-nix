{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_compute";
  version = "5.0.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "170d1p7zf1x1mnm357ply50arq0d1a0z8linl1jibxg5mv37qabv";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Compute Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ olcai stesie ];
  };
}
