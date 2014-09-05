#!/bin/bash
echo "########### Remove Build Directory"
rm -rf build
echo "########### Starting Build"
middleman build
echo "########### Finished Build"
echo "########### Clean up files"
rm -rf build/assets/javascripts/app
rm -rf build/assets/javascripts/lib
rm -rf build/assets/javascripts/config/environments/development.js
rm -rf build/assets/javascripts/config/environments/environment.js
rm -rf build/assets/javascripts/config/routes.js
#rm -rf build/assets/javascripts/ui
rm -rf build/assets/javascripts/vendor/angular*.js
rm -rf build/assets/javascripts/index.js
rm -rf build/assets/stylesheets/app
rm -rf build/assets/stylesheets/vendor

while getopts ":pd:" opt; do
  case $opt in
    p)
      #echo "-p was triggered, Parameter: $OPTARG" >&2
      #mv build/index.html build/main.html
      rm build/index.html
      mv build/phone.html build/index.html
      echo "Built Phonegap Index"
      ;;
    d)
      echo "-d was triggered, Parameter: $OPTARG" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done