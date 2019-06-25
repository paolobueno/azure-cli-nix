{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-mgmt-cdn";
  version = "3.1.0";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "1qvnksmvsg8cw1ac6vbdxjdqsm7s1sak27k8xy24hm7c9a8y1nqc";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure CDN Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
