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
    sha256 = "11j123sc1db9nnkr24p46vap8xc51cgg78kr8gd2zrfg49qfg2pw";
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
