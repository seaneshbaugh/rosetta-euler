var x, y, product, s, palindromes;

palindromes = [];

for (x = 100; x < 1000; x++) {
  for (y = 100; y < 1000; y++) {
    product = x * y;

    s = String(product);

    if (s === s.split("").reverse().join("")) {
      palindromes.push(product);
    }
  }
}

console.log(Math.max.apply(null, palindromes));
