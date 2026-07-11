impl Solution {
    pub fn is_rational_equal(s: String, t: String) -> bool {
        fn gcd(a: i128, b: i128) -> i128 {
            if b == 0 { a.abs() } else { gcd(b, a % b) }
        }

        fn add(a: (i128, i128), b: (i128, i128)) -> (i128, i128) {
            let num = a.0 * b.1 + b.0 * a.1;
            let den = a.1 * b.1;
            let g = gcd(num, den);
            (num / g, den / g)
        }

        fn pow10(n: usize) -> i128 {
            (0..n).fold(1, |acc, _| acc * 10)
        }

        fn parse(x: &str) -> (i128, i128) {
            if !x.contains('.') {
                return (x.parse::<i128>().unwrap(), 1);
            }
            let parts: Vec<&str> = x.splitn(2, '.').collect();
            let integer = parts[0];
            let frac = parts[1];
            if !frac.contains('(') {
                if frac.is_empty() {
                    return (integer.parse().unwrap(), 1);
                }
                let base = (integer.parse::<i128>().unwrap(), 1);
                let frac_part = (frac.parse::<i128>().unwrap(), pow10(frac.len()));
                return add(base, frac_part);
            }
            let rep_parts: Vec<&str> = frac.splitn(2, '(').collect();
            let nonrep = rep_parts[0];
            let rep = &rep_parts[1][..rep_parts[1].len() - 1];
            let mut base = (integer.parse::<i128>().unwrap(), 1);
            if !nonrep.is_empty() {
                base = add(base, (nonrep.parse().unwrap(), pow10(nonrep.len())));
            }
            let repeat_num = rep.parse::<i128>().unwrap();
            let repeat_den = (pow10(rep.len()) - 1) * pow10(nonrep.len());
            add(base, (repeat_num, repeat_den))
        }

        let sf = parse(&s);
        let tf = parse(&t);
        sf.0 * tf.1 == tf.0 * sf.1
    }
}
