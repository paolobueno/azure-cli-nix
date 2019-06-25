{ stdenv, buildPythonPackage, fetchPypi
, azure-nspkg
}:

buildPythonPackage rec {
  pname = "azure-storage-nspkg";
  version = "3.1.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "049qcmgshz7dj9yaqma0fwcgbxwddgwyfcw4gmv45xfmaa3bwfvg";
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
