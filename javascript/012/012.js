"use strict";

var i, j, triangleNumber;

Number.prototype.primeFactors = function() {
  var v, i;

  v = null;

  for (i = 2; i < this - 1; i += 1) {
    if (this % i === 0) {
      v = i;

      break;
    }
  }

  if (v) {
    return [v].concat(Math.floor(this / v).primeFactors());
  } else {
    return [this];
  }
};

Number.prototype.numberOfDivisors = function() {
  var factorGroups;

  factorGroups = {};

  this.primeFactors().forEach(function(primeFactor) {
    factorGroups[primeFactor] = (factorGroups[primeFactor] || 1) + 1;
  });

  return Object.keys(factorGroups).reduce(function(previousValue, key) {
    return previousValue * factorGroups[key];
  }, 1);
};

i = 2;

triangleNumber = 1;

while (triangleNumber.numberOfDivisors() <= 500) {
  triangleNumber = 0;

  for (j = 1; j <= i; j += 1) {
    triangleNumber += j;
  }

  i += 1;
}

console.log(triangleNumber);
