# Docker image with all necessary Homebrew and Ensembl taps
FROM linuxbrew/linuxbrew

# Install some required packages
RUN sudo apt-get update \
 && sudo apt-get -y install python wget \
 && sudo apt-get clean \
 && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup moonshine
ENV ENSEMBL_MOONSHINE_ARCHIVE $HOME/ENSEMBL_MOONSHINE_ARCHIVE 
RUN mkdir -p $ENSEMBL_MOONSHINE_ARCHIVE

# Turn off analytics and tap brew & Ensembl repositories
RUN brew analytics off \
 && brew tap homebrew/science \
 && brew tap homebrew/nginx \
 && brew tap ensembl/ensembl \
 && brew tap ensembl/moonshine \
 && brew tap ensembl/web \
 && brew tap ensembl/cask

