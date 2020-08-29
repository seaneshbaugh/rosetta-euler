"use strict";

Number.prototype.primeFactors = function() {
  let v = null;

  for (let i = 2; i < this - 1; i += 1) {
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
  const factorGroups = {};

  this.primeFactors().forEach((primeFactor) => factorGroups[primeFactor] = (factorGroups[primeFactor] || 1) + 1);

  return Object.keys(factorGroups).reduce((previousValue, key) => (previousValue * factorGroups[key]), 1);
};

let i = 2;

let triangleNumber = 1;

while (triangleNumber.numberOfDivisors() <= 500) {
  triangleNumber = 0;

  for (let j = 1; j <= i; j += 1) {
    triangleNumber += j;
  }

  i += 1;
}

console.log(triangleNumber);
