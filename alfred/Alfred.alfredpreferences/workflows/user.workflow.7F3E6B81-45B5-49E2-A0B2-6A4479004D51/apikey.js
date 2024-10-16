const fs = require('fs');
const path = require('path');

const apikey_filepath = path.join(process.env.alfred_workflow_data, "apikey.txt");

function save_apikey() {
  const apikey = process.env.apikey;
  fs.writeFileSync(apikey_filepath, apikey);
  console.log(apikey);
}

function load_apikey() {
  try {
    return fs.readFileSync(apikey_filepath);
  } catch(err) {
    return null;
  }
}

module.exports = {
  apikey_filepath,
  save_apikey,
  load_apikey
};

if(require.main === module) save_apikey();
