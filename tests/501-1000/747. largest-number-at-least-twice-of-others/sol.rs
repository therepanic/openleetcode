impl Solution {
    pub fn dominant_index(nums: Vec<i32>) -> i32 {
        let mut m = -1;
        let mut s = -1;
        let mut idx = -1;
        for (i, &x) in nums.iter().enumerate() {
            if x > m {
                s = m;
                m = x;
                idx = i as i32;
            } else if x > s {
                s = x;
            }
        }
        if m >= s * 2 { idx } else { -1 }
    }
}
