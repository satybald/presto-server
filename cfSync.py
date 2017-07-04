#!/usr/bin/python
import os
import uuid

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

def nodeReplacement(data):
	uid = str(uuid.uuid4())
	data = data.replace('{UID}', uid)
	return data

def config():
	data = readFromFile('./templates/config.properties.template')
	cf = configReplacement(data)
	writeToFile('./etc/config.properties', cf)

def node():
	data = readFromFile('./templates/node.properties.template')
	node = nodeReplacement(data)
	writeToFile('./etc/node.properties', node)

if __name__ == '__main__':
	config()
	node()