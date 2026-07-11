impl Solution {
    pub fn binary_gap(n: i32) -> i32 {
        let mut max_dist = 0;
        let mut curr_dist = 0;
        let mut found_first_one = false;
        let mut n = n;
        
        while n > 0 {
            let bit = n % 2;
            
            if bit == 1 {
                if found_first_one {
                    max_dist = max_dist.max(curr_dist);
                }
                
                curr_dist = 1;
                found_first_one = true;
            } else {
                if found_first_one {
                    curr_dist += 1;
                }
            }
            
            n /= 2;
        }
        
        max_dist
    }
}
