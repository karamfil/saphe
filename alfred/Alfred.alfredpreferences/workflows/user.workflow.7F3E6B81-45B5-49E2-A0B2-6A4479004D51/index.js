const alfy = require('alfy');
const fs = require('fs');
const apikey = require('./apikey');

const api_key = apikey.load_apikey();
const api_url = "http://words.bighugelabs.com/api/2/" + api_key + "/:word:/json";

function get_url_for(word) {
    return api_url.replace(":word:", word);
}

function fetch_synonyms(word) {
  return alfy.fetch(get_url_for(word), {maxAge: 86400000});
}

function make_item(word_type, result_type, word) {
  return {
    uid: word,
    title: word,
    subtitle: result_type + " " + word_type,
    autocomplete: word,
    arg: word,
    icon: {
      path: `resources/${result_type}.png`
    }
  };
}

function make_error_item(error) {
  if(error.statusCode == 404) {
    return [{
      title: "Word not found"
    }];
  }
  else if(error.statusCode == 500) {
    return [{
      title: error.message
    }];
  }
}

function make_api_key_request_item(api_key) {
  return [{
    uid: "api_key",
    title: "Press enter to set the API key",
    arg: api_key
  }];
}

const flatten = arr => arr.reduce((a, b) => a.concat(Array.isArray(b) ? flatten(b) : b), []);

function make_items(response) {
  let items = Object.keys(response).map(word_type => {
    return Object.keys(response[word_type]).map(result_type => {
      let results = response[word_type][result_type];
      return results.map(word => make_item(word_type, result_type, word));
    });
  });
  return flatten(items);
}

function output(data) {
  console.log(JSON.stringify(data));
}

function items(data, variables = {}) {
  output({items: data,
          variables: variables});
}

function isApiKey(word) {
  if(word) {
    return word.match(/\w{32}/) &&
           word.match(/\d+/) &&
           word.match(/[a-zA-z]+/);
  }
}

const word = process.argv[2];

if(!api_key || isApiKey(word)) {
  items(make_api_key_request_item(word), {apikey: word});
} else if(word) {
  fetch_synonyms(word)
    .then(make_items, make_error_item)
    .then(items);
}
