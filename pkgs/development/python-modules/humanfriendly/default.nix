{ stdenv, buildPythonPackage, fetchPypi
, monotonic
}:

buildPythonPackage rec {
  pname = "humanfriendly";
  version = "4.18";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "07arwnyin4liavbhvp5v37v1kfcafsv3q3m2qdxjwy3gml87n193";
  };

  propagatedBuildInputs = [
    monotonic
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Human friendly output for text interfaces using Python";
    homepage = https://humanfriendly.readthedocs.io;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}

