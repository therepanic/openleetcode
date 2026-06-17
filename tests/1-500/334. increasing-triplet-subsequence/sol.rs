impl Solution {
    pub fn increasing_triplet(nums: Vec<i32>) -> bool {
        let mut a = i32::MAX;
        let mut b = i32::MAX;
        let mut f = false;
        for &x in &nums {
            if x <= a {
                a = x;
            } else if x <= b {
                b = x;
            } else {
                f = true;
            }
        }
        f
    }
}
