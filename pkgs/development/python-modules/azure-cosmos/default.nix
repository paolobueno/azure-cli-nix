{ stdenv, buildPythonPackage, fetchPypi, python
, requests
, six
}:

buildPythonPackage rec {
  pname = "azure_cosmos";
  version = "3.1.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "f4e8c207e74296644ae2cb9816084562d8471f9b27c3f5533d048e87aa711a13";
  };

  propagatedBuildInputs = [
    requests
    six
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Azure Cosmos Python SDK";
    homepage = https://github.com/Azure/azure-documentdb-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
