#!/usr/bin/env node

var cli = require('cli');

var image_id = function(container_id, callback) {
  cli.exec("docker inspect --format='{{.Image}}' " + container_id, function(output) {
    if (!output) {
      callback();
    }

    var image_id = null;

    output.forEach(function(line) {
      if (!line) {
        return;
      }

      image_id = line;
    });

    callback(image_id);
  });
};

var image_name = function(container_id, callback) {
  cli.exec('docker images --no-trunc | grep ' + container_id + " | awk '{ print $1 }'", function(output) {
    if (!output) {
      callback();
    }

    var image_name = null;

    output.forEach(function(line) {
      if (!line) {
        return;
      }

      image_name = line;
    });

    callback(image_name);
  });
};

cli.main(function() {
  cli.exec('find "/var/www" -type f -iname "fig.yml"', function(output) {
    if (!output) {
      return;
    }

    var vhost = [];

    output.forEach(function(fig_file) {
      if (!fig_file) {
        return;
      }

      cli.exec('fig -f "' + fig_file + '" ps -q', function(output) {
        if (!output) {
          return;
        }

        var project = {};

        output.forEach(function(container_id) {
          if (!container_id) {
            return;
          }

          image_id(container_id, function(image_id) {
            if (!image_id) {
              return;
            }

            image_name(image_id, function(image_name2) {
              console.log(image_name2);
            });
          });
        });
      });
    });
  });
});
