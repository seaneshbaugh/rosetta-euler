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

Array.prototype.overlap = function(other) {
  this.forEach((element) => {
    const index = other.indexOf(element);

    if (index !== -1) {
      other = other.slice(0, index).concat(other.slice(index + 1));
    }
  });

  return other.concat(this).sort((x, y) => x < y);
};

let primeFactorLists = [];

for (let i = 1; i <= 20; i += 1) {
  primeFactorLists.push(i.primeFactors());
}

console.log(primeFactorLists
  .reduce((previousValue, currentValue) => previousValue.overlap(currentValue))
  .reduce((previousValue, currentValue) => previousValue * currentValue));
