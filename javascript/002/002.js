"use strict";

let fibs = [1, 2];

while (fibs.slice(-1)[0] < 4000000) {
  fibs.push(fibs.slice(-2)[0] + fibs.slice(-1)[0]);
}

console.log(fibs.filter((element) => element % 2 === 0).reduce((previousValue, currentValue) => previousValue + currentValue));
