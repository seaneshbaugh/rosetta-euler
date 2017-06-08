fn collatz(n: u64) -> u64 {
    if n <= 1 {
        return 1;
    } else {
        if n % 2 == 0 {
            return n / 2;
        } else {
            return (3 * n) + 1;
        }
    }
}

fn main () {
    let mut max_length: u64 = 1;

    let mut max_start: u64 = 1;

    for start in 1..1000000 {
        let mut length: u64 = 1;

        let mut n: u64 = start;

        while n > 1 {
            n = collatz(n);

            length = length + 1;
        }

        if length > max_length {
            max_length = length;

            max_start = start;
        }
    }

    println!("{}", max_start);
}
