# Docker image with all necessary Homebrew and Ensembl taps
FROM linuxbrew/brew:1.9.3

# Install some required packages
RUN sudo apt-get update \
 && sudo apt-get -y install python wget \
 && sudo apt-get clean \
 && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup moonshine
ENV HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE /home/linuxbrew/ENSEMBL_MOONSHINE_ARCHIVE
ENV HOMEBREW_NO_AUTO_UPDATE 1
RUN mkdir -p $HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE

# Turn off analytics and tap brew & Ensembl repositories
RUN brew analytics off \
 && brew tap denji/nginx \
 && brew tap ensembl/ensembl \
 && brew tap ensembl/external \
 && brew tap ensembl/moonshine \
 && brew tap ensembl/web \
 && brew tap ensembl/cask

RUN brew install ensembl/cask/pre-flight \
 && brew install ensembl/cask/basic-dependencies \
 && brew install ensembl/cask/perl-clibs \
 && brew cleanup \
 && rm -rf /home/linuxbrew/.cpan /home/linuxbrew/.cache/Homebrew

