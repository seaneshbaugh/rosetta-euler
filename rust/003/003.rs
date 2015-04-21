fn main() {
    let factors = prime_factors(600851475143u64);

    let mut max = factors[0];

    let mut i = 1usize;

    while i < factors.len() {
        if factors[i] > max {
            max = factors[i];
        }

        i += 1usize;
    }

    println!("{}", max);
}

fn prime_factors(n: u64) -> Vec<u64> {
    let mut found = false;
    let mut v = 2u64;
    let mut i = 2u64;

    while i < n - 1u64 && !found {
        if n % i == 0u64 {
            v = i;

            found = true;
        }

        i += 1u64;
    }

    let mut factors = vec![];

    if found {
        factors.push(v);

        factors.extend(prime_factors(n / v));
    } else {
        factors.push(n);
    }

    return factors;
}
