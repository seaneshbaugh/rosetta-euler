fn main() {
    let mut factor_lists = ~[];

    for i in range(1u64, 21u64) {
        factor_lists.push(prime_factors(i));
    }

    let mut factors = ~[];

    for factor_list in factor_lists.iter() {
        factors = overlap(factors.clone(), factor_list.clone());
    }

    println(fmt!("%s", factors.iter().fold(1, |a, &b| a * b).to_str()));
}

fn prime_factors(n: u64) -> ~[u64] {
    let mut found = false;
    let mut v = 2;
    let mut i = 2;

    while i < n - 1 && !found {
        if n % i == 0 {
            v = i;

            found = true;
        }

        i += 1;
    }

    let mut factors = ~[];

    if found {
        factors.push(v);

        factors.push_all(prime_factors(n / v));
    } else {
        factors.push(n);
    }

    return factors;
}

fn remove_first<T:Eq + Clone>(i: &T, v: ~[T]) -> ~[T] {
    let index = v.iter().position(|x| *x == *i);

    let mut result = ~[];

    if index != None {
        if index.unwrap() > 0 {
            result.push_all(v.slice(0, index.unwrap()));
        }

        result.push_all(v.slice(index.unwrap() + 1, v.len()));
    } else {
        result.push_all(v);
    }

    return result;
}

fn overlap<T: Eq + Clone>(a: ~[T], b: ~[T]) -> ~[T] {
    let mut result = a;

    for n in b.iter() {
        result = remove_first(n, result);
    }

    result.push_all(b);

    return result;
}
