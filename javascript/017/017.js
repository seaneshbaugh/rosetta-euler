"use strict";

Number.prototype.toEnglish = function() {
  const underTwenty = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
    "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"];

  const tens = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"];

  const denom = ["thousand", "million", "billion", "trillion", "quadrillion", "quintillion", "sextillion", "septillion",
    "octillion", "nonillion", "decillion", "undecillion", "duodecillion", "tredecillion", "quattuordecillion", "sexdecillion",
    "septendecillion", "octodecillion", "novemdecillion", "vigintillion"];

  if (this < 0) {
    return `negative ${(-this).toEnglish()}`;
  } else if (this < 20) {
    return underTwenty[this];
  } else if (this < 100) {
    let result = "";

    for (let v = 0; v < tens.length; v += 1) {
      const cap = tens[v];

      const val = 20 + (10 * v);

      if (val + 10 <= this) {
        continue;
      }

      if (this % 10 != 0) {
        result = `${cap}-${underTwenty[this % 10]}`;
      } else {
        result = cap;
      }

      break;
    }

    return result;
  } else if (this < 1000) {
    let result = "";

    const rem = Math.floor(this / 100);

    const mod = this % 100;

    if (rem > 0) {
      result = `${underTwenty[rem]} hundred`;

      if (mod > 0) {
        result += " and ";
      }
    }

    if (mod > 0) {
      result += mod.toEnglish();
    }

    return result;
  } else if (this < 10 ** 66) {
    let result = "";

    for (let v = 0; v < denom.length; v += 1) {
      const didx = v - 1;

      const dval = 1000 ** v;

      if (dval <= this) {
        continue;
      }

      const mod = 1000 ** didx;

      const l = this / mod;

      const r = this - (l * mod);

      result = `${l.toEnglish()} ${denom[didx - 1]}`;

      if (r > 0) {
        result += `, ${r.toEnglish()}`;
      }

      return result;
    }
  } else {
    return this.toString();
  }
};

let result = "";

for (let i = 1; i <= 1000; i += 1) {
  result += i.toEnglish();
}

console.log(result.replace(/\s|-/g, "").length);
