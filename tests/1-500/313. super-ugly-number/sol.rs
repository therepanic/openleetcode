impl Solution {
    pub fn nth_super_ugly_number(n: i32, primes: Vec<i32>) -> i32 {
        let n = n as usize;
        let mut ugly = vec![1i32; n];
        let mut idx = vec![0; primes.len()];
        let mut val: Vec<i64> = primes.iter().map(|&p| p as i64).collect();
        for i in 1..n {
            let mut m = val[0];
            for j in 1..val.len() {
                if val[j] < m {
                    m = val[j];
                }
            }
            ugly[i] = m as i32;
            for j in 0..primes.len() {
                if val[j] == m {
                    idx[j] += 1;
                    val[j] = ugly[idx[j]] as i64 * primes[j] as i64;
                }
            }
        }
        ugly[n - 1]
    }
}
