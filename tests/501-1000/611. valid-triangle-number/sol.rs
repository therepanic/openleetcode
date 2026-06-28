impl Solution {
    pub fn triangle_number(nums: Vec<i32>) -> i32 {
        let mut nums = nums;
        nums.sort();
        let n = nums.len();
        let mut count = 0;
        for i in (2..n).rev() {
            let mut left = 0;
            let mut right = i.wrapping_sub(1);
            while left < right {
                if nums[left] + nums[right] > nums[i] {
                    count += (right - left) as i32;
                    right -= 1;
                } else {
                    left += 1;
                }
            }
        }
        count
    }
}
