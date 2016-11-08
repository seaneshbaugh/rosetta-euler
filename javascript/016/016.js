"use strict";

const Big = require("../lib/big.js/big.js");

console.log(Big(2).pow(1000).toFixed().split("").map((digit) => parseInt(digit)).reduce((digit, sum) => sum + digit));
