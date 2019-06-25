{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-reservations
}:

buildPythonPackage rec {
  pname = "azure_cli_reservations";
  version = "0.4.3";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "07yn79dwjrhhqsl4qsp9a4f35wp3z8xv33qi6zaxa64wwglfif1c";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-reservations
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Reservations Command Module";
    homepage = https://github.com/azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
