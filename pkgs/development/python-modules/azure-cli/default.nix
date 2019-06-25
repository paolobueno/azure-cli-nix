{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-acr
, azure-cli-acs
, azure-cli-advisor
, azure-cli-ams
, azure-cli-appservice
, azure-cli-backup
, azure-cli-batch
, azure-cli-batchai
, azure-cli-billing
, azure-cli-botservice
, azure-cli-cdn
, azure-cli-cloud
, azure-cli-cognitiveservices
, azure-cli-command-modules-nspkg
, azure-cli-configure
, azure-cli-consumption
, azure-cli-container
, azure-cli-core
, azure-cli-cosmosdb
, azure-cli-deploymentmanager
, azure-cli-dla
, azure-cli-dls
, azure-cli-dms
, azure-cli-eventgrid
, azure-cli-eventhubs
, azure-cli-extension
, azure-cli-feedback
, azure-cli-find
, azure-cli-hdinsight
, azure-cli-interactive
, azure-cli-iot
, azure-cli-iotcentral
, azure-cli-keyvault
, azure-cli-kusto
, azure-cli-lab
, azure-cli-maps
, azure-cli-monitor
, azure-cli-natgateway
, azure-cli-network
, azure-cli-nspkg
, azure-cli-policyinsights
, azure-cli-privatedns
, azure-cli-profile
, azure-cli-rdbms
, azure-cli-redis
, azure-cli-relay
, azure-cli-reservations
, azure-cli-resource
, azure-cli-role
, azure-cli-search
, azure-cli-security
, azure-cli-servicebus
, azure-cli-servicefabric
, azure-cli-signalr
, azure-cli-sql
, azure-cli-sqlvm
, azure-cli-storage
, azure-cli-telemetry
, azure-cli-vm
}:

buildPythonPackage rec {
  pname = "azure_cli";
  version = "2.0.67";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0cnzpa5b2pkzsh2qzbp8kgp1iir53avm24wzmr1c78fq9sv8zami";
  };

  propagatedBuildInputs = [
    azure-cli-acr
    azure-cli-acs
    azure-cli-advisor
    azure-cli-ams
    azure-cli-appservice
    azure-cli-backup
    azure-cli-batch
    azure-cli-batchai
    azure-cli-billing
    azure-cli-botservice
    azure-cli-cdn
    azure-cli-cloud
    azure-cli-cognitiveservices
    azure-cli-command-modules-nspkg
    azure-cli-configure
    azure-cli-consumption
    azure-cli-container
    azure-cli-core
    azure-cli-cosmosdb
    azure-cli-deploymentmanager
    azure-cli-dla
    azure-cli-dls
    azure-cli-dms
    azure-cli-eventgrid
    azure-cli-eventhubs
    azure-cli-extension
    azure-cli-feedback
    azure-cli-find
    azure-cli-hdinsight
    azure-cli-interactive
    azure-cli-iot
    azure-cli-iotcentral
    azure-cli-keyvault
    azure-cli-kusto
    azure-cli-lab
    azure-cli-maps
    azure-cli-monitor
    azure-cli-natgateway
    azure-cli-network
    azure-cli-nspkg
    azure-cli-policyinsights
    azure-cli-privatedns
    azure-cli-profile
    azure-cli-rdbms
    azure-cli-redis
    azure-cli-relay
    azure-cli-reservations
    azure-cli-resource
    azure-cli-role
    azure-cli-search
    azure-cli-security
    azure-cli-servicebus
    azure-cli-servicefabric
    azure-cli-signalr
    azure-cli-sql
    azure-cli-sqlvm
    azure-cli-storage
    azure-cli-telemetry
    azure-cli-vm
  ];

  # filter azure-xxx-nspkg packages from $program_PYTHONPATH and wrap invoker script setting it
  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"

    IFS=: read -r -d "" -a path_array < <(printf '%s:\0' "$program_PYTHONPATH")
    filteredPythonPath=""

    for p in ''${path_array[@]}; do
      if [[ ! "$p" =~ "nspkg-" ]]; then
        filteredPythonPath="$filteredPythonPath"''${filteredPythonPath:+':'}"$p"
      fi
    done

    wrapProgram $out/bin/az --set PYTHONPATH "$filteredPythonPath" --prefix PATH ":" ${python}/bin
  '';

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
