impl Solution {
    pub fn min_subsequence(nums: Vec<i32>) -> Vec<i32> {
        let mut s = nums.clone();
        s.sort();
        let mut v = Vec::new();
        let mut l = s.len();
        let mut sum_v = 0;
        let mut sum_rem: i32 = s.iter().sum();
        while sum_v <= sum_rem {
            l -= 1;
            sum_v += s[l];
            sum_rem -= s[l];
            v.push(s[l]);
        }
        v
    }
}
