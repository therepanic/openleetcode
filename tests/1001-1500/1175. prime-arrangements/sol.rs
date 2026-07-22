impl Solution {
    pub fn num_prime_arrangements(n: i32) -> i32 {
        const MOD: i64 = 1_000_000_007;
        
        let n = n as usize;
        let mut is_prime = vec![true; 101];
        is_prime[0] = false;
        is_prime[1] = false;
        
        for i in 2..=100 {
            if i * i > 100 {
                break;
            }
            if is_prime[i] {
                let mut j = i * i;
                while j <= 100 {
                    is_prime[j] = false;
                    j += i;
                }
            }
        }
        
        let mut prefix_prime = vec![0; 101];
        for i in 2..=100 {
            prefix_prime[i] = prefix_prime[i - 1] + if is_prime[i] { 1 } else { 0 };
        }
        
        let x = prefix_prime[n];
        let y = n - x;
        let mut pro_x: i64 = 1;
        let mut pro_y: i64 = 1;
        
        for i in 2..=x {
            pro_x = (pro_x * i as i64) % MOD;
        }
        for i in 2..=y {
            pro_y = (pro_y * i as i64) % MOD;
        }
        
        ((pro_x * pro_y) % MOD) as i32
    }
}
