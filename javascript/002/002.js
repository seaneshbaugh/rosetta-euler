"use strict";

var fibs;

fibs = [1, 2];

while (fibs.slice(-1)[0] < 4000000) {
  fibs.push(fibs.slice(-2)[0] + fibs.slice(-1)[0]);
}

console.log(fibs.filter(function(element) {
  return element % 2 === 0;
}).reduce(function(previousValue, currentValue) {
  return previousValue + currentValue;
}));
