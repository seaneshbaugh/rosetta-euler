fn pythagorean_triple_with_sum(sum: u64) -> Vec<u64> {
    if sum < 11 {
        return vec![];
    }

    for m in 2..(sum + 1) {
        for n in 1..sum {
            if m > n {
                let a = (m * m) - (n * n);

                let b = 2 * m * n;

                let c = (m * m) + (n * n);

                if (a + b + c == sum) && ((a * a) + (b * b) == (c * c)) {
                    return vec![a, b, c];
                }
            }
        }
    }

    return vec![]
}

fn main() {
    let sides: Vec<u64> = pythagorean_triple_with_sum(1000);

    let product: u64 = sides.iter().fold(1, |p, &side| p * side);

    println!("{}", product);
}
