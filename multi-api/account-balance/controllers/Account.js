'use strict';

var utils = require('../utils/writer.js');
var Account = require('../service/AccountService');

module.exports.getAccountBalance = function getAccountBalance (req, res, next) {
  Account.getAccountBalance()
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
