impl Solution {
    pub fn find_peak_element(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        if n < 3 {
            return if nums[0] >= nums[n - 1] { 0 } else { (n - 1) as i32 };
        }
        let mut left = 0usize;
        let mut right = n - 1;
        while left < right {
            let mid = left + (right - left) / 2;
            if mid > 0 && mid < n - 1 && nums[mid - 1] < nums[mid] && nums[mid] > nums[mid + 1] {
                return mid as i32;
            }
            if nums[mid] < nums[mid + 1] {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        left as i32
    }
}
