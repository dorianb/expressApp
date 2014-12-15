var argv = require('minimist')(process.argv.slice(2));

if(argv['help'])
{
  console.log('export [--help] [--format {name}] output');
  console.log('Introduction message');
  console.log('--help          Print this message');
  console.log('--format {name} One of csv(default) or json');
  console.log('output          Exported file');
}
