impl Solution {
    pub fn num_decodings(s: String) -> i32 {
        use std::collections::HashMap;
        
        let m: i64 = 1_000_000_007;
        let chars: Vec<char> = s.chars().collect();
        let n = chars.len() - 1;
        
        let mut d: HashMap<String, i64> = HashMap::new();
        for i in 1..=26 {
            d.insert(i.to_string(), 1);
        }
        for i in 0..=9 {
            let val = if i < 7 { 2 } else { 1 };
            d.insert(format!("*{}", i), val);
        }
        d.insert("*".to_string(), 9);
        d.insert("**".to_string(), 15);
        d.insert("1*".to_string(), 9);
        d.insert("2*".to_string(), 6);
        
        let mut dp = vec![0i64; n + 2];
        dp[0] = *d.get(&chars[0].to_string()).unwrap_or(&0);
        dp[n + 1] = 1;
        
        for i in 0..n {
            let one = chars[i + 1].to_string();
            let two = format!("{}{}", chars[i], chars[i + 1]);
            
            let mut count = (*d.get(&one).unwrap_or(&0) * dp[i]) % m;
            let prev = if i > 0 { dp[i - 1] } else { 1 };
            count = (count + *d.get(&two).unwrap_or(&0) * prev) % m;
            dp[i + 1] = count;
            
            if dp[i + 1] == 0 {
                return 0;
            }
        }
        
        dp[n] as i32
    }
}
