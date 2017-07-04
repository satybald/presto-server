#!/usr/bin/python
import os

def readFromFile(name):
	with open(name, 'r') as f:
		data = f.read()
	return data


def writeToFile(name, data):
	with open(name, 'w') as f:
		f.write(data)

def configReplacement(data):
	#coordinator
	isCoordinator = os.environ['IS_COORDINATOR']
	data = data.replace("{IS_COORDINATOR}", isCoordinator)

	discvoeryUrl = os.environ['DISCOVERY_URL']
	data = data.replace("{DISCOVERY_URL}", discvoeryUrl)
	
	return data

def config():
	data = readFromFile('./configs/config.properties.template')
	cf = configReplacement(data)
	writeToFile('./configs/config.properties', cf)

if __name__ == '__main__':
	config()