{ stdenv, buildPythonPackage, fetchPypi, python, isPy27
, azure-common
, azure-nspkg
, cryptography
, futures
, python-dateutil
, requests
}:

buildPythonPackage rec {
  pname = "azure_multiapi_storage";
  version = "0.2.3";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0ffqbymn5f4lnaq5ksx28xxawzbm9nq46xxlqg9gybsnfccsgpiw";
  };

  propagatedBuildInputs = [
    azure-common
    azure-nspkg
    cryptography
    python-dateutil
    requests
  ] ++ stdenv.lib.optional (isPy27) futures;

  postFixup = ''
    rm $out/${python.sitePackages}/azure/__init__.py
  '';

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Storage Client Library for Python with multi API version support.";
    homepage = https://github.com/Azure/azure-multiapi-storage-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
