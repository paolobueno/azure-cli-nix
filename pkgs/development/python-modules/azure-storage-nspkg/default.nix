{ stdenv, buildPythonPackage, fetchPypi
, azure-nspkg
}:

buildPythonPackage rec {
  pname = "azure-storage-nspkg";
  version = "3.1.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0gkhm597x691fs50shv6ghkd54446bw9mbjkgyjn9i5qfdnbv8vx";
  };

  propagatedBuildInputs = [
    azure-nspkg
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Storage Namespace Package [Internal]";
    homepage = https://github.com/Azure/azure-storage-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
