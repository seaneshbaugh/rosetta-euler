"use strict";

let palindromes = [];

for (let x = 100; x < 1000; x += 1) {
  for (let y = 100; y < 1000; y += 1) {
    const product = x * y;

    const s = String(product);

    if (s === s.split("").reverse().join("")) {
      palindromes.push(product);
    }
  }
}

console.log(Math.max.apply(null, palindromes));
