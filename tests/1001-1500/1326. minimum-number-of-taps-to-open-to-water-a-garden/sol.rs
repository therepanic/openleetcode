impl Solution {
    pub fn min_taps(n: i32, ranges: Vec<i32>) -> i32 {
        let n = n as usize;
        let mut max_range = vec![0; n + 1];
        
        for i in 0..ranges.len() {
            let left = if (i as i32 - ranges[i]) < 0 { 0 } else { i as i32 - ranges[i] } as usize;
            let right = if (i as i32 + ranges[i]) > n as i32 { n } else { (i as i32 + ranges[i]) as usize };
            max_range[left] = max_range[left].max(right);
        }
        
        let mut end = 0;
        let mut farthest = 0;
        let mut taps = 0;
        let mut i = 0;
        
        while end < n {
            while i <= end {
                farthest = farthest.max(max_range[i]);
                i += 1;
            }
            
            if farthest <= end {
                return -1;
            }
            
            end = farthest;
            taps += 1;
        }
        
        taps
    }
}
