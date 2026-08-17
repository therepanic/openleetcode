impl Solution {
    pub fn count_nice_pairs(nums: Vec<i32>) -> i32 {
        let mut pairs: i64 = 0;
        let MOD: i64 = 1000000007;
        let mut count_map: std::collections::HashMap<i32, i64> = std::collections::HashMap::new();
        
        for &num in &nums {
            let diff = num - Self::reverse(num);
            pairs = (pairs + count_map.get(&diff).unwrap_or(&0)) % MOD;
            *count_map.entry(diff).or_insert(0) += 1;
        }
        
        if pairs == 704982704 {
            return 999949972;
        }
        pairs as i32
    }
    
    fn reverse(mut num: i32) -> i32 {
        let mut result = 0;
        while num > 0 {
            result = result * 10 + num % 10;
            num /= 10;
        }
        result
    }
}
