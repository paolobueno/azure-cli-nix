{ stdenv, buildPythonPackage, fetchPypi, python
, azure-common
, azure-mgmt-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_iotcentral";
  version = "1.0.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0myk20pfq3ya0z9a4lj87hwd5vk26wsm8w6iq1798pavcfxb2iz2";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure IoTCentral Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
