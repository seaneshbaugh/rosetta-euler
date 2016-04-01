fn main() {
    let n = 10001u64;

    let limit = (((n as f64) * (n as f64).ln()) + ((n as f64) * (n as f64).ln().ln())) as u64;

    println!("{}", sieve_of_atkin(limit)[n as usize - 1]);
}

fn sieve_of_atkin(limit: u64) -> Vec<u64> {
    let mut primes = vec![];

    let mut sieve: Vec<bool> = Vec::new();

    sieve.reserve(limit as usize + 1);

    while sieve.len() < limit as usize + 1 {
        sieve.push(false);
    }

    let square_root_of_limit = (limit as f64).sqrt() as u64;

    let mut n: u64;

    for x in 1..(square_root_of_limit + 1) {
        for y in 1..(square_root_of_limit + 1) {
            n = (4 * x * x) + (y * y);

            if n <= limit && (n % 12 == 1 || n % 12 == 5) {
                sieve[n as usize] = !sieve[n as usize];
            }

            n = (3 * x * x) + (y * y);

            if n <= limit && n % 12 == 7 {
                sieve[n as usize] = !sieve[n as usize];
            }

            if x > y {
                n = (3 * x * x) - (y * y);

                if n < limit && n % 12 == 11 {
                    sieve[n as usize] = !sieve[n as usize];
                }
            }
        }
    }

    sieve[2] = true;

    sieve[3] = true;

    primes.push(2);

    primes.push(3);

    n = 5;

    while n < square_root_of_limit {
        if sieve[n as usize] {
            let mut i = n * n;

            while i < limit {
                sieve[i as usize] = false;

                i += n * n;
            }

            primes.push(n);
        }

        n += 2;
    }

    while n < limit {
        if sieve[n as usize] {
            primes.push(n);
        }

        n += 2;
    }

    return primes;
}
