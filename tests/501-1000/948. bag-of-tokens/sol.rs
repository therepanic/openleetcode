impl Solution {
    pub fn bag_of_tokens_score(tokens: Vec<i32>, power: i32) -> i32 {
        let mut tokens = tokens;
        tokens.sort();
        let n = tokens.len();
        let mut l = 0;
        let mut curr = 0;
        let mut power = power;
        
        while l < n && tokens[l] <= power {
            power -= tokens[l];
            l += 1;
            curr += 1;
        }
        
        let mut r = n as i32 - 1;
        let mut res = curr;
        
        while (l as i32) < r && curr > 0 {
            power += tokens[r as usize];
            curr -= 1;
            r -= 1;
            
            while l <= r as usize && tokens[l] <= power {
                power -= tokens[l];
                l += 1;
                curr += 1;
            }
            res = res.max(curr);
        }
        
        res
    }
}
