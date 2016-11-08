"use strict";

const Big = require("../lib/big.js/big.js");

function binomialCoefficient(top, bottom) {
  let numerator = Big(1);

  for (var i = Big(top).minus(bottom).plus(1); i.lte(top); i = i.plus(1)) {
    numerator = numerator.times(i);
  }

  let denominator = Big(1);

  for (var i = Big(2); i.lte(bottom); i = i.plus(1)) {
    denominator = denominator.times(i);
  }

  return numerator.div(denominator);
}

function latticePaths(m, n) {
  m = Big(m);

  n = Big(n);

  if (m.lte(n)) {
    return binomialCoefficient(m.plus(n), n);
  } else {
    return binomialCoefficient(m.plus(n), m);
  }
}

console.log(latticePaths(20, 20).toString());
