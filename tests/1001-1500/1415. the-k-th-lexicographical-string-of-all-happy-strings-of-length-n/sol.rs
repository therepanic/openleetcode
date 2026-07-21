impl Solution {
    pub fn get_happy_string(n: i32, k: i32) -> String {
        let n = n as usize;
        let mut k = k as i32;
        let total = 3 * (1 << (n - 1));
        if k > total {
            return String::new();
        }
        
        k -= 1;
        let mut result = String::with_capacity(n);
        let mut last = '\0';
        
        for pos in 0..n {
            let branch = 1 << (n - pos - 1);
            let mut choices = Vec::new();
            for &c in &['a', 'b', 'c'] {
                if c != last {
                    choices.push(c);
                }
            }
            
            let idx = (k / branch) as usize;
            result.push(choices[idx]);
            
            last = choices[idx];
            k %= branch;
        }
        
        result
    }
}
