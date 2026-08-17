impl Solution {
    pub fn find_latest_step(arr: Vec<i32>, m: i32) -> i32 {
        let n = arr.len();
        if m as usize == n { return m; }
        
        let mut groups = vec![0; n + 2];
        let mut latest_step = -1;
        
        for i in 0..n {
            let idx = arr[i] as usize;
            let left = groups[idx - 1];
            let right = groups[idx + 1];
            
            if left == m || right == m {
                latest_step = i as i32;
            }
            
            let new_len = left + right + 1;
            groups[idx - left as usize] = new_len;
            groups[idx + right as usize] = new_len;
        }
        
        latest_step
    }
}
