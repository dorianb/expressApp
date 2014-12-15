# Node.js project using express Framework

This is the GROUP3 project (Dorian BAGUR, Najlaa SEDKI and Maoqiao ZHOU).
We used coffeeScript as programmation language and MarkDown to document our code.

## Functionalities
* provide a login formular accepting: username and email
* provide a sign up formular requiring: username, email, password, re-password, firstname, lastname
* validation server and client
* import/export in csv and json

There is only one url for all screens.

## Install
Use this command to install locally all the dependencies needed:
```
npm install
```

## Test
Two tests are provided, execute them using the following command:
```
npm test
```

## Database structure

## Import script
A script is provided to import json and csv data in database. Use the following commands to import data:

```
node ./bin/import --format csv sample.csv
node ./bin/import --format json sample.json
```

# Export script
A script is provided to export data store in database to json and csv files. Use the following commands to export data:

```
node ./bin/export --format csv sample.csv
node ./bin/export --format json sample.json
```

#### Export

```
./bin/export --help
export [--help] [--format {name}] output
Introduction message
--help          Print this message
--format {name} One of csv(default) or json
output          Exported file
```

Export must implement the "stream.readable" class inside a module './lib/export'. Here is an example on how to use the export module:

```
export = require './lib/export'
db = require './lib/db'
client = db './db'
export client, format: 'csv'
.pipe fs.createReadableStream './sample.csv'
```
