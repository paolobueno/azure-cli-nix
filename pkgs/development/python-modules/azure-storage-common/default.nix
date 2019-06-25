{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-storage-nspkg
, cryptography
, python-dateutil
, requests
}:

buildPythonPackage rec {
  pname = "azure_storage_common";
  version = "1.4.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0jly2yan1c52dz935psvcnj8vg8y925w7vb3jp4d28sswg61fj6y";
  };

  propagatedBuildInputs = [
    azure-common
    azure-storage-nspkg
    cryptography
    python-dateutil
    requests
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Storage Common Client Library for Python";
    homepage = https://github.com/Azure/azure-storage-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
