impl Solution {
    pub fn num_times_all_blue(flips: Vec<i32>) -> i32 {
        let mut res = 0;
        let mut max_flips = 0;
        
        for i in 0..flips.len() {
            max_flips = max_flips.max(flips[i]);
            if max_flips == (i + 1) as i32 {
                res += 1;
            }
        }
        
        res
    }
}
