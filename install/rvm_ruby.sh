#!/bin/bash
\curl -L https://get.rvm.io | bash -s stable --ruby

gem update --system

echo "gem: --no-document" >> ~/.gemrc

gem install bundler

gem install nokogiri

gem install rails --version=4.2.1
