{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_batch";
  version = "6.0.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1wwcv0m0ckgr5awbgb9cqprhlvggv952hvn174cm903wjijsm6nq";
  };

  propagatedBuildInputs = [
    azure-common
    azure-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Batch Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
