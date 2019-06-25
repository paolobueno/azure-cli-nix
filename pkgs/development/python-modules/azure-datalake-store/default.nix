{ stdenv, buildPythonPackage, fetchPypi, isPy27, pythonOlder, python
, adal
, azure-nspkg
, cffi
, futures
, pathlib2
, requests
}:

buildPythonPackage rec {
  pname = "azure_datalake_store";
  version = "0.0.39";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0qcnvsna3izqzx1xh30k28x2ipcr0qnipdxs5ah0m15n7l8h6mwr";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
  '';

  propagatedBuildInputs = [
    adal
    azure-nspkg
    cffi
    requests
  ]
    ++ stdenv.lib.optional (isPy27) futures
    ++ stdenv.lib.optional (pythonOlder "3.4") pathlib2;

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Azure Data Lake Store Filesystem Client Library for Python";
    homepage = https://github.com/Azure/azure-data-lake-store-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
