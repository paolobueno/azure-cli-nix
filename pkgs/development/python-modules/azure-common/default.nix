{ stdenv, buildPythonPackage, fetchPypi, isPyPy
, azure-nspkg
}:

buildPythonPackage rec {
  pname = "azure_common";
  version = "1.1.22";
  format = "wheel";
  disabled = isPyPy;

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0kyf23bl15ga7802iiklhcwmvs272hy7rjq9684z9hkdklvxfs60";
  };

  propagatedBuildInputs = [
    azure-nspkg
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Client Library for Python (Common)";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ olcai stesie ];
  };
}
