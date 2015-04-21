fn main() {
    let mut factor_lists = vec![];

    for i in 1u64..21u64 {
        factor_lists.push(prime_factors(i));
    }

    let mut factors = vec![];

    for factor_list in factor_lists.iter() {
        factors = overlap(factors.clone(), factor_list.clone());
    }

    println!("{}", factors.iter().fold(1, |a, &b| a * b));
}

fn prime_factors(n: u64) -> Vec<u64> {
    let mut found = false;
    let mut v = 2u64;
    let mut i = 2u64;

    while i < n - 1u64 && !found {
        if n % i == 0u64 {
            v = i;

            found = true;
        }

        i += 1u64;
    }

    let mut factors = vec![];

    if found {
        factors.push(v);

        factors.extend(prime_factors(n / v));
    } else {
        factors.push(n);
    }

    return factors;
}

fn remove_first<T:Eq + Clone>(i: T, v: Vec<T>) -> Vec<T> {
    let index = v.iter().position(|x| *x == i);

    let mut result = vec![];

    if index != None {
        if index.unwrap() > 0 {
            result.extend(v[0 .. index.unwrap()].to_vec());
        }

        result.extend(v[index.unwrap() + 1 .. v.len()].to_vec());
    } else {
        result.extend(v);
    }

    return result;
}

fn overlap<T: Eq + Clone>(a: Vec<T>, b: Vec<T>) -> Vec<T> {
    let mut result = a;

    for n in b.iter() {
        result = remove_first(n.clone(), result);
    }

    result.extend(b);

    return result;
}
