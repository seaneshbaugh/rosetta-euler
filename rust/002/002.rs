fn main() {
    let mut i = 0;
    let mut j = 1;
    let mut k = i + j;
    let mut sum = 0;

    while k < 4000000 {
        if k % 2 == 0 {
            sum += k;
        }

        i = j;

        j = k;

        k = i + j;
    }

    println!("{}", sum);
}
