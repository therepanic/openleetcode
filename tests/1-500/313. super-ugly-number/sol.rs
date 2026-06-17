impl Solution {
    pub fn nth_super_ugly_number(n: i32, primes: Vec<i32>) -> i32 {
        let n = n as usize;
        let mut ugly = vec![1; n];
        let mut idx = vec![0; primes.len()];
        let mut val = primes.clone();
        for i in 1..n {
            let m = *val.iter().min().unwrap();
            ugly[i] = m;
            for j in 0..primes.len() {
                if val[j] == m {
                    idx[j] += 1;
                    val[j] = ugly[idx[j]] * primes[j];
                }
            }
        }
        ugly[n - 1]
    }
}
