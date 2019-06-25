{ stdenv, buildPythonPackage, fetchPypi, python
, adal
, antlr4-python2-runtime
, antlr4-python3-runtime
, argcomplete
, azure-cli-nspkg
, azure-cli-telemetry
, azure-mgmt-resource
, colorama
, futures
, humanfriendly
, jmespath
, knack
, msrest
, msrestazure
, ndg-httpsclient
, paramiko
, pip
, psutil
, pyasn1
, pygments
, pyjwt
, pyopenssl
, pyperclip
, pyyaml
, requests
, six
, tabulate
, wheel
}:

buildPythonPackage rec {
  pname = "azure-cli-core";
  version = "2.0.67";

  src = fetchPypi {
    inherit pname version;
    sha256 = "16cjx5wnn5ar2969m2sgyrzgia90rdzgl179rmch78siswfw9wx3";
  };

  # Hackily force build w/ wheel 0.31
  postPatch = ''
    sed -e '/azure-namespace-package/d' -i  setup.cfg
    sed -e 's/wheel==0.30.0/wheel/' -i setup.py azure_cli_core.egg-info/requires.txt
  '';

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
  '';

  propagatedBuildInputs = [
    adal
    antlr4-python2-runtime
    antlr4-python3-runtime
    argcomplete
    azure-cli-nspkg
    azure-cli-telemetry
    azure-mgmt-resource
    colorama
    humanfriendly
    jmespath
    knack
    msrest
    msrestazure
    ndg-httpsclient
    paramiko
    pip
    psutil
    pyasn1
    pygments
    pyjwt
    pyopenssl
    pyperclip
    pyyaml
    requests
    six
    tabulate
    wheel
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Core Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
