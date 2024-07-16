{ stdenv, fetchzip, lib }:

stdenv.mkDerivation {
  name = "nerd-fonts-symbols";
  src = fetchzip {
    url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.zip";
    sha256 = "86iQmX9J3YpWoCVYGvlyi6A/6uJcPa2iU0MgCmekkiE="; 
    stripRoot = false;
    };
  installPhase = ''
    mkdir -p $out/share/fonts
    cp -v *.ttf $out/share/fonts/
  '';
  meta = with lib; {
    description = "Nerd Fonts Symbols Only";
    homepage = "https://github.com/ryanoasis/nerd-fonts";
    license = licenses.mit;
    platforms = platforms.all;
  };
}

