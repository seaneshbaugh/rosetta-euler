fn main() {
    let mut x: u64;

    let mut y: u64;

    let mut palindromes = vec![];

    x = 100u64;

    while x <= 999u64 {
        y = 100u64;

        while y <= 999u64 {
            let product: u64 = x * y;

            let s = product.to_string();

            if s == s.chars().rev().collect::<String>() {
                palindromes.push(product);
            }

            y += 1u64;
        }

        x += 1u64;
    }

    let mut max = palindromes[0];

    let mut i = 1usize;

    while i < palindromes.len() {
        if palindromes[i] > max {
            max = palindromes[i];
        }

        i += 1usize;
    }

    println!("{}", max);
}
