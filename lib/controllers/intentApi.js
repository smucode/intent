'use strict';

var _         = require('lodash'),
    mongoose  = require('mongoose'),
    Intent    = mongoose.model('Intent');

exports.list = function (req, res, next) {
  Intent.find(function (err, intents) {
    if (err) return console.error(err);
    res.json(intents);
  });
};

exports.create = function (req, res, next) {
  var intent = new Intent(req.body);
  intent.id = Math.floor(Math.random() * 1000000);
  intent.save(function(err, intent) {
     if (err) return console.error(err);
     res.json(intent);
  });
};

exports.read = function (req, res, next) {
  var intentId = req.params.intentId;
  Intent.findOne({id: intentId}, function (err, intent) {
    if (err) return console.error(err);
    res.json(intent);
  });
};

exports.update = function (req, res, next) {
  var intentId = req.params.intentId;
  Intent.findOne({id: intentId}, function (err, intent) {
    _.each(req.body, function(val, key) {
      intent[key] = val;
    });
    intent.save(function(err, intent) {
       if (err) return console.error(err);
       res.json(intent);
    });
  });
};

exports.del = function (req, res, next) {
  var intentId = req.params.intentId;
  Intent.findOne({id: intentId}, function (err, intent) {
    intent.remove(function() {
      res.end();
    });
  });
};
