var path = require('path'),
    fs = require('fs'),
    less = require('less'); // https://github.com/less/less.js

var parser = new less.Parser();

var src = "./lib/styles.less",
    destination = "./dist/styles.css";

fs.readFile(src,
        "utf8", function (error, result) {
    parser.parse(result, function (obj, data) {
        fs.writeFile(destination, data.toCSS(), function (error) {
            if (error) {
                console.log(error);
            } else {
                console.log(destination + " file was saved");
            }
        });
    });
});
