{ stdenv, buildPythonPackage, fetchPypi, python
, azure-common
, azure-mgmt-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_kusto";
  version = "0.3.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0dg4nliawskq29kpn9xbilq4bmlx9sp0pl7pbxfhxrhbznls39jp";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Kusto Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
