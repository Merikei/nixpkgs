{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  qt6,

  # Optional
  zlib, # Lossless data-compression
  barcode, # GNU barcode
  qrencode,
  libzint, # Barcode generating tool
}:

stdenv.mkDerivation {
  pname = "glabels-qt";
  version = "3.99-unstable-2025-12-04";

  src = fetchFromGitHub {
    owner = "j-evins";
    repo = "glabels-qt";
    rev = "3.99-master602";
    hash = "sha256-7MQufoU1GBvmZd8FRn331/PwmwQMuZeuFKQqViRI754=";
  };

  buildInputs = [
    qt6.qtbase
    qt6.qtsvg

    zlib
    barcode
    qrencode
    libzint
  ];

  nativeBuildInputs = [
    cmake
    qt6.qttools
    qt6.wrapQtAppsHook
  ];

  meta = with lib; {
    description = "Label Designer (Qt/C++";
    homepage = "https://github.com/j-evins/glabels-qt";
    license = with licenses; [
      gpl3Plus
      lgpl3Plus
      mit
    ];
    mainProgram = "glabels-qt";
    maintainers = [ maintainers.matthewcroughan ];
    platforms = platforms.linux;
  };
}
