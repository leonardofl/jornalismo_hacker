##!/usr/bin/python
# -*- coding: utf-8 -*-

from __future__ import unicode_literals
import csv
import sys

"""Remove commas and line breaks inside quoted string values from CSV files"""

class Converter:

    def __init__(self, input_file_name):
        self.input = open(input_file_name, 'r')
        self.output = open('cleared-' + input_file_name, 'w')

    def convert(self):
        csv_reader = csv.reader(self.input)
        csv_writer = csv.writer(self.output)
        for row in csv_reader:
            for i in range(0, len(row)):
                row[i] = row[i].replace(',', ';').replace('\n', ' ')
            csv_writer.writerow(row)

def main():
    input_file_name = sys.argv[1]
    converter = Converter(input_file_name)
    converter.convert()

if __name__ == "__main__":
    main()
