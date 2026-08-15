impl Solution {
    pub fn ways_to_make_fair(nums: Vec<i32>) -> i32 {
        let mut even = 0;
        let mut odd = 0;
        let mut even_left = 0;
        let mut odd_left = 0;
        let mut result = 0;
        for (idx, &ele) in nums.iter().enumerate() {
            if idx % 2 == 0 {
                even += ele;
            } else {
                odd += ele;
            }
        }
        for (idx, &ele) in nums.iter().enumerate() {
            if idx % 2 == 0 {
                even -= ele;
            } else {
                odd -= ele;
            }
            if even + odd_left == odd + even_left {
                result += 1;
            }
            if idx % 2 == 0 {
                even_left += ele;
            } else {
                odd_left += ele;
            }
        }
        result
    }
}
