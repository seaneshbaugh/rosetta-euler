fn binomial_coefficient(top: u128, bottom: u128) -> u128 {
    return ((top - bottom + 1)..(top + 1)).fold(1, |p, i| p * i) / (2..(bottom + 1)).fold(1, |p, i| p * i);
}

fn lattice_paths(m: u128, n: u128) -> u128 {
    if m <= n {
        return binomial_coefficient(m + n, n);
    } else {
        return binomial_coefficient(m + n, m);
    }
}

fn main() {
    println!("{}", lattice_paths(20, 20));
}
