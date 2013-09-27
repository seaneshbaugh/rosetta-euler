fn main() {
    let factors = prime_factors(600851475143u64);

    let mut max = factors[0];

    let mut i = 1;

    while i < factors.len() {
        if factors[i] > max {
            max = factors[i];
        }

        i += 1;
    }

    println(fmt!("%s", max.to_str()));
}

fn prime_factors(n: u64) -> ~[u64] {
    let mut found = false;
    let mut v = 2;
    let mut i = 2;

    while i < n - 1 && !found {
        if n % i == 0 {
            v = i;

            found = true;
        }

        i += 1;
    }

    let mut factors = ~[];

    if found {
        factors.push(v);

        factors.push_all(prime_factors(n / v));
    } else {
        factors.push(n);
    }

    return factors;
}
