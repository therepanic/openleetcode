impl Solution {
    pub fn single_number(nums: Vec<i32>) -> Vec<i32> {
        let mut x = 0;
        for &n in &nums {
            x ^= n;
        }

        let bit = x & -x;
        let mut a = 0;
        let mut b = 0;
        for &n in &nums {
            if (n & bit) != 0 {
                a ^= n;
            } else {
                b ^= n;
            }
        }

        vec![a, b]
    }
}
