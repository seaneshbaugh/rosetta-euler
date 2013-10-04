"use strict";

var i, primeFactorLists;

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

Array.prototype.overlap = function(other) {
  this.forEach(function(element) {
    var index;

    index = other.indexOf(element);

    if (index !== -1) {
      other = other.slice(0, index).concat(other.slice(index + 1));
    }
  });

  return other.concat(this).sort(function(x, y) {
    return x < y;
  });
};

primeFactorLists = [];

for (i = 1; i <= 20; i += 1) {
  primeFactorLists.push(i.primeFactors());
}

console.log(primeFactorLists.reduce(function(previousValue, currentValue) {
  return previousValue.overlap(currentValue);
}).reduce(function(previousValue, currentValue) {
  return previousValue * currentValue;
}));
