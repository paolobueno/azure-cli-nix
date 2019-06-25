{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-mgmt-trafficmanager";
  version = "0.51.0";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "1pxfm076gsdp4iwxq87xlb7b43nnkj1ikikvipml23g7b6a90bv7";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Traffic Manager Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
