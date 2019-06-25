{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-mgmt-recoveryservicesbackup";
  version = "0.1.2";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "05hxq8qqyw031wglffzkzlg65ivw2ng4shmbl5cr5p5jx7ghswkn";
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
    description = "Microsoft Azure Recovery Services Backup Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
