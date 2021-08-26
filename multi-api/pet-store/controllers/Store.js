'use strict';

var utils = require('../utils/writer.js');
var Store = require('../service/StoreService');

module.exports.getInventory = function getInventory (req, res, next) {
  Store.getInventory()
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
