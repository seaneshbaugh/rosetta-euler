fn main() {
    println!("{}", (1u64 .. 101u64).collect::<Vec<u64>>().iter().fold(0, |a, b| a + b).pow(2) - (1u64 .. 101u64).collect::<Vec<u64>>().iter().map(|x| x * x).fold(0, |a, b| a + b));
}
