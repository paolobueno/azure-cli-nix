{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-mgmt-recoveryservices";
  version = "0.1.1";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "08jslycp0zy6hy25h36xja5igqfmaf0nx1fys51pxq56sbs6sjx8";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrestazure
  ];

  patches = [
    ./msrestazure-version.patch
  ];

  # Fix build w/ wheel 0.31, see https://github.com/Azure/azure-storage-python/pull/443
  postPatch = ''
    sed -i azure_bdist_wheel.py \
      -e '1,483d' -e '/from wheel.bdist_wheel import bdist_wheel/ { s/^#//; }'
  '';

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Recovery Services Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
