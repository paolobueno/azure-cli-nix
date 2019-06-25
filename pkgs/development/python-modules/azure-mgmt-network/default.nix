{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_network";
  version = "3.0.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1qvl9amyczb628k23wd4x5h3g74wjdv5qx2v5zpjkbhsmsr764v1";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Network Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ olcai stesie ];
  };
}
