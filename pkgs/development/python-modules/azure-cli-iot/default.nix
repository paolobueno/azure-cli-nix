{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-iothub
, azure-mgmt-iothubprovisioningservices
, pyopenssl
}:

buildPythonPackage rec {
  pname = "azure_cli_iot";
  version = "0.3.11";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1v7l52d6hvmpw64z64q0kcr0sqxbs2963f25aalz66ccw77rl0ik";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-iothub
    azure-mgmt-iothubprovisioningservices
    pyopenssl
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools IoT Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
