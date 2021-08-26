'use strict';


/**
 * Returns current account balance
 * Returns a map of various account 
 *
 * returns List
 **/
exports.getAccountBalance = function() {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] = [{balanceType: "available", amount: 100, currency: "GBP"},{balanceType: "ledger", amount: 200, currency: "GBP"}];
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}

