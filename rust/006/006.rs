fn main() {
    println(fmt!("%s", ((std::num::pow(range(1u64, 101u64).fold(0, |a, b| a + b) as f64, 2.0) as u64) - range(1u64, 101u64).map(|x| x * x).fold(0, |a, b| a + b)).to_str()));
}
