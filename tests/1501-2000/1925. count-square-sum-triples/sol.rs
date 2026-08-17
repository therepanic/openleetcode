impl Solution {
    pub fn count_triples(n: i32) -> i32 {
        let mut cnt = 0;
        let nsqrt = (n as f64).sqrt() as i32;
        for s in 2..=nsqrt {
            let start = (s & 1) + 1;
            let mut t = start;
            while t < s {
                if gcd(s, t) != 1 {
                    t += 2;
                    continue;
                }
                let c = s * s + t * t;
                if c > n {
                    break;
                }
                let k = n / c;
                cnt += 2 * k;
                t += 2;
            }
        }
        cnt
    }
}
fn gcd(a: i32, b: i32) -> i32 {
    let mut x = a;
    let mut y = b;
    while y != 0 {
        let temp = y;
        y = x % y;
        x = temp;
    }
    x
}
