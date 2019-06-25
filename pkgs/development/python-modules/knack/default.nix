{ stdenv, buildPythonPackage, fetchPypi
, argcomplete
, colorama
, jmespath
, pygments
, pyyaml
, six
, tabulate
}:

buildPythonPackage rec {
  pname = "knack";
  version = "0.6.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "018s27w0iyxfp7077nls5b5cybs9z9gl2hz0kdqd94rzi0404bnw";
  };

  propagatedBuildInputs = [
    argcomplete
    colorama
    jmespath
    pygments
    pyyaml
    six
    tabulate
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "A Command-Line Interface framework";
    homepage = https://github.com/microsoft/knack;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}

