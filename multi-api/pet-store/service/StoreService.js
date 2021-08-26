'use strict';


/**
 * Returns pet inventories by status
 * Returns a map of status codes to quantities
 *
 * returns Map
 **/
exports.getInventory = function () {
  return new Promise(function (resolve, reject) {
    var examples = {};
    examples['application/json'] = { "food": 100, "cats": 20, "dogs": 10 };
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}

