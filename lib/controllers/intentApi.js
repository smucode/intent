'use strict';

var _ = require('lodash');

var map = {};

var id = function(req) {
  var id = req.params.userId;
  map[id] = map[id] || {};
  return id;
};

exports.list = function (req, res, next) {
  var arr = _.reduce(_.values(map), function (memo, intents) {
    return memo.concat(_.values(intents));
  }, []);
  res.json(arr);
};

exports.create = function (req, res, next) {
  var intent = req.body;
  intent.id = Math.floor(Math.random() * 1000000);
  map[id(req)][intent.id] = intent;
  res.json(intent);
};

exports.read = function (req, res, next) {
  var intentId = req.params.intentId;
  var intent = map[id(req)][intentId];
  res.json(intent);
};

exports.update = function (req, res, next) {
  var intent = req.body;
  map[id(req)][intent.id] = intent;
  res.json(intent);
};

exports.del = function (req, res, next) {
  var intentId = req.params.intentId;
  delete map[id(req)][intentId];
  res.end();
};
