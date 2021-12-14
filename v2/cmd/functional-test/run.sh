#!/bin/bash

# reading os type from flags
CURRENT_OS=$1



# if [ "${CURRENT_OS}" == "windows-latest" ]
# then
#      echo 'Running on windows platform'
#      echo 'Building functional-test binary'
#      go build
    
#      echo 'Building Nuclei binary from current branch'
#      go build -o nuclei_dev.exe ../nuclei
    
#      echo 'Installing latest release of nuclei'
#      go build -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
    
#      echo $(pwd)
#      echo $(ls)
#      echo 'Starting Nuclei functional test'
#      ./functional-test.exe -main ./nuclei.exe -dev ./nuclei_dev.exe -testcases testcases.txt
# else
#      echo 'Building functional-test binary'
#      go build -o functional-test
     
#      echo 'Building Nuclei binary from current branch'
#      go build -o nuclei_dev ../nuclei
     
#      echo 'Installing latest release of nuclei'
#      go build -v -o nuclei github.com/projectdiscovery/nuclei/v2/cmd/nuclei
     
#      echo $(pwd)
#      echo $(ls)
#      echo 'Starting Nuclei functional test'
#      ./functional-test -main ./nuclei -dev ./nuclei_dev -testcases testcases.txt
# fi

     WINDOWSDEVBUILD = "nuclei_dev.exe"
     LINUXDEVBUILD = "nuclei_dev"
     WINDOWSBUILD = "nuclei.exe"
     LINUXBUILD = "nuclei"
     WINDOWSFUNCTIONALBUILD = "functional-test.exe"
     LINUXFUNCTIONALBUILD = "functional-test"

     echo 'Building functional-test binary'
     if [ "${CURRENT_OS}" == "windows-latest" ]
     then
     go build -o WINDOWSFUNCTIONALBUILD
     else 
     go build -o LINUXFUNCTIONALBUILD
     fi

     echo 'Building Nuclei binary from current branch'
     if [ "${CURRENT_OS}" == "windows-latest" ]
     then
     go build -o WINDOWSDEVBUILD ../nuclei
     else 
     go build -o LINUXDEVBUILD ../nuclei
     fi
    
     echo 'Installing latest release of nuclei'
     if [ "${CURRENT_OS}" == "windows-latest" ]
     then
     go build -v -o WINDOWSBUILD github.com/projectdiscovery/nuclei/v2/cmd/nuclei
     else 
     go build -v -o LINUXBUILD github.com/projectdiscovery/nuclei/v2/cmd/nuclei
     fi
    
     echo $(pwd)
     echo $(ls)
     echo 'Starting Nuclei functional test'
     if [ "${CURRENT_OS}" == "windows-latest" ]
     then
     ./WINDOWSFUNCTIONALBUILD -main ./WINDOWSBUILD -dev ./WINDOWSDEVBUILD -testcases testcases.txt
     else 
     ./LINUXFUNCTIONALBUILD -main ./LINUXBUILD -dev ./LINUXDEVBUILD -testcases testcases.txt
     fi
