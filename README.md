# Node.js project using express Framework

This is the GROUP3 project.
We used coffeeScript as programmation language and MarkDown to document our code.

## Functionalities
* provide a login formular accepting: username and email
* provide a sign up formular requiring: username, email, password, re-password, firstname, lastname
* validation server and client
* import/export in csv and json

There will be only one url for all screens.

### Import/export scripts
Create 2 commands `import` and `export`. Each commands take 2 options "--help" and "--format".
For a simple argument parse, you may use [minimist]. For a more complex parser, you may use [parameters].

#### Import

```
./bin/import --help
import [--help] [--format {name}] input
Introduction message
--help          Print this message
--format {name} One of csv(default) or json
input           Imported file
```

Import must implement the "stream.writable" class inside a module './lib/import'. Here is an example on how to use the import module:

```
import = require './lib/import'
db = require './lib/db'
client = db './db'
fs
.createReadStream './sample.csv'
.pipe import client, format: 'csv'
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
