#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
  echo "Please run script as root."
  exit 1
fi

rpm_files=$(find . -type f -name "*.rpm")

if [ -z "$rpm_files" ]; then
  echo "No RPM files found."
  exit 1
fi

for rpm_file in $rpm_files; do
  echo "Install $rpm_file..."
  rpm -ivh "$rpm_file"
  if [ $? -ne 0 ]; then
    echo "Error during install $rpm_file."
    exit 1
  fi
done

echo "All RPM files installed."