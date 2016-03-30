"use strict";

var chainLengths, start, length, n;

function collatz(n) {
    if (n <=1 ) {
        return 1;
    } else {
        if (n % 2 !== 0) {
            return (3 * n) + 1;
        } else {
            return ~~(n / 2);
        }
    }
}

chainLengths = {};

for (start = 1; start < 1000000; start += 1) {
    length = 1;

    n = start;

    while (n > 1) {
        n = collatz(n);

        length += 1;
    }

    chainLengths[start.toString()] = length;
}

console.log(Object.keys(chainLengths).map(function(start) {
    return [start, chainLengths[start]]
}).sort(function(a, b) {
    return a[1] - b[1];
}).slice(-1)[0][0]);
