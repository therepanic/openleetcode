impl Solution {
    pub fn k_concatenation_max_sum(arr: Vec<i32>, k: i32) -> i32 {
        const MOD: i64 = 1_000_000_007;
        
        fn kadanes(nums: &[i32]) -> i64 {
            let mut best: i64 = 0;
            let mut total: i64 = 0;
            for &x in nums {
                total += x as i64;
                if total < 0 {
                    total = 0;
                }
                best = best.max(total);
            }
            best
        }
        
        let k = k as usize;
        
        if k <= 3 {
            let extended: Vec<i32> = arr.iter().cycle().take(arr.len() * k).copied().collect();
            return (kadanes(&extended) % MOD) as i32;
        }
        
        let sum: i64 = arr.iter().map(|&x| x as i64).sum();
        let s = 0.max(sum * (k as i64 - 1)) % MOD;
        
        let double_arr: Vec<i32> = arr.iter().chain(arr.iter()).copied().collect();
        
        let v1 = s + kadanes(&arr);
        let v2 = kadanes(&double_arr);
        (v1.max(v2) % MOD) as i32
    }
}
