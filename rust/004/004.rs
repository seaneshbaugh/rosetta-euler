fn main() {
    let mut x: int;

    let mut y: int;

    let mut palindromes = ~[];

    x = 100;

    while x <= 999 {
        y = 100;

        while y <= 999 {
            let product: int = x * y;

            let s = product.to_str();

            if s == s.rev_iter().collect() {
                palindromes.push(product);
            }

            y += 1;
        }

        x += 1;
    }

    let mut max = palindromes[0];

    let mut i = 1;

    while i < palindromes.len() {
        if palindromes[i] > max {
            max = palindromes[i];
        }

        i += 1;
    }

    println(fmt!("%s", max.to_str()));
}
