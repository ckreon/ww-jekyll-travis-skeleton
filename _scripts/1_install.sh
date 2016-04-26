#!/bin/bash
set -x # Show the output of the following commands (useful for debugging)

# Import the SSH deployment key
openssl aes-256-cbc -K $encrypted_@@@@@@@@@@@_key -iv $encrypted_@@@@@@@@@@_iv -in _deploy/$JTS_KEYNAME.enc -out _deploy/$JTS_KEYNAME -d
rm _deploy/$JTS_KEYNAME.enc
chmod 600 _deploy/$JTS_KEYNAME
mv _deploy/$JTS_KEYNAME ~/.ssh/$JTS_KEYNAME

# Install Other Packages
npm install

# Install Zopfli
git clone https://github.com/google/zopfli.git _zopfli
cd _zopfli
make
chmod +x zopfli
cd ..