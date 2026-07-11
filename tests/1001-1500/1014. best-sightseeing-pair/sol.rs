impl Solution {
    pub fn max_score_sightseeing_pair(values: Vec<i32>) -> i32 {
        let n = values.len();
        let mut suffix_max = vec![0; n];
        suffix_max[n - 1] = values[n - 1] - (n as i32 - 1);
        
        for i in (0..n - 1).rev() {
            suffix_max[i] = std::cmp::max(suffix_max[i + 1], values[i] - i as i32);
        }
        
        let mut max_score = i32::MIN;
        for i in 0..n - 1 {
            max_score = std::cmp::max(max_score, values[i] + i as i32 + suffix_max[i + 1]);
        }
        
        max_score
    }
}
