{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_graphrbac";
  version = "0.60.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0yady5vcwc8n7nhimfyc5km9vgvjq6x69k3076hxqcf6vw16c9hb";
  };

  propagatedBuildInputs = [
    azure-common
    azure-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Graph RBAC Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
