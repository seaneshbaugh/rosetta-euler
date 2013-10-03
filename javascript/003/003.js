"use strict";

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
}

console.log(Math.max.apply(null, (600851475143).primeFactors()));
