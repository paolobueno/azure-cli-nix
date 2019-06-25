{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-maps
}:

buildPythonPackage rec {
  pname = "azure_cli_maps";
  version = "0.3.5";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0gknc66pg71y7ijq39l6hd86i341qcqh2d7wjx40sbavnz8bn328";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-maps
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Maps Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
