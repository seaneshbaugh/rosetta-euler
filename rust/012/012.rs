use std::collections::HashMap;

fn main() {
    let mut n : u64 = 1;

    loop {
        n += 1;

        let triangle_number : u64 = (1..n).fold(0, |sum, i| sum + i);

        let mut factor_counts : HashMap<u64, u64> = HashMap::new();

        for factor in prime_factors(triangle_number) {
            let count : u64 = factor_counts.get(&factor).unwrap_or(&1) + 1;

            factor_counts.insert(factor, count);
        }

        let number_of_divisors = factor_counts.values().fold(1, |sum, i| sum * i);

        if number_of_divisors >= 500 {
            println!("{}", triangle_number);

            break;
        }
    }
}

fn prime_factors(n: u64) -> Vec<u64> {
    let mut found : bool = false;
    let mut v : u64 = 2;
    let mut i : u64 = 2;

    while i < n - 1 && !found {
        if n % i == 0 {
            v = i;

            found = true;
        }

        i += 1;
    }

    let mut factors : Vec<u64> = vec![];

    if found {
        factors.push(v);

        factors.extend(prime_factors(n / v));
    } else {
        factors.push(n);
    }

    return factors;
}
