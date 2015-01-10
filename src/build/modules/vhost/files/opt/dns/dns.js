#!/usr/bin/env node

var fs = require('fs');

var named = require('node-named');
var yaml = require('js-yaml');

var server = named.createServer();

server.on('query', function(query) {
  var domain = query.name();

  switch (query.type()) {
    case 'A':
      try {
        var data = yaml.safeLoad(fs.readFileSync('dns.yml', 'utf8'));

        if (data[domain]) {
          query.addAnswer(domain, new named.ARecord(data[domain]), 1);
        }

        server.send(query);
      }
      catch (e) {
        server.send(query);
      }

      break;
    default:
      server.send(query);
  }
});

server.listen(53, '127.0.0.1');
