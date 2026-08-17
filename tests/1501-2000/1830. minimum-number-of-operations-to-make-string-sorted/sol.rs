impl Solution {
    pub fn make_string_sorted(s: String) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let n = s.len();
        let chars: Vec<char> = s.chars().collect();
        let mut fac = vec![1i64; n + 1];
        let mut inv_fac = vec![1i64; n + 1];
        
        for i in 1..=n {
            fac[i] = (fac[i - 1] * i as i64) % MOD;
        }
        inv_fac[n] = Solution::mod_pow(fac[n], MOD - 2);
        for i in (1..=n).rev() {
            inv_fac[i - 1] = (inv_fac[i] * i as i64) % MOD;
        }
        
        let mut freq = vec![0i64; 26];
        for &ch in &chars {
            freq[ch as usize - 97] += 1;
        }
        
        let mut ans = 0i64;
        for i in 0..n {
            let mut small_right = 0i64;
            for j in 0..(chars[i] as usize - 97) {
                small_right = (small_right + freq[j]) % MOD;
            }
            
            let rem = n - i - 1;
            let mut temp = 1i64;
            temp = (temp * fac[rem]) % MOD;
            temp = (temp * small_right) % MOD;
            
            for &x in &freq {
                if x > 1 {
                    temp = (temp * inv_fac[x as usize]) % MOD;
                }
            }
            
            freq[chars[i] as usize - 97] -= 1;
            ans = (ans + temp) % MOD;
        }
        
        ans as i32
    }
    
    fn mod_pow(mut x: i64, mut n: i64) -> i64 {
        const MOD: i64 = 1_000_000_007;
        if x == 1 || n == 0 {
            return 1;
        }
        if n == 1 {
            return x % MOD;
        }
        if n % 2 == 1 {
            return (x * Solution::mod_pow((x * x) % MOD, n / 2)) % MOD;
        }
        Solution::mod_pow((x * x) % MOD, n / 2) % MOD
    }
}
