{ stdenv, buildPythonPackage, fetchPypi
, adal
, msrest
}:

buildPythonPackage rec {
  pname = "msrestazure";
  version = "0.6.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "14ahwb7d9zc34k8czkwkb04f88z0lhcswa718hvhgwc83nqjbmg9";
  };

  propagatedBuildInputs = [
    adal
    msrest
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "AutoRest swagger generator Python client runtime. Azure-specific module.";
    homepage = https://github.com/Azure/msrestazure-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
