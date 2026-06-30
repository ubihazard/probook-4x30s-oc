#!/bin/bash

mkdir -p Original

# DSDT and accompanying SSDTs must be disassembled together (do not attempt
# to disassemble other ACPI files with the `-da` option):
iasl -da -dl Dump/DSDT.aml Dump/SSDT*.aml

mv Dump/*.dsl Original
