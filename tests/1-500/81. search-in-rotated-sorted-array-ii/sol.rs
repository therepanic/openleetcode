impl Solution {
    pub fn search(nums: Vec<i32>, target: i32) -> bool {
        if nums.is_empty() {
            return false;
        }
        let mut left = 0i32;
        let mut right = nums.len() as i32 - 1;
        while left <= right {
            let mid = left + (right - left) / 2;
            let mv = nums[mid as usize];
            if mv == target {
                return true;
            }
            if nums[left as usize] == mv {
                left += 1;
            } else if nums[left as usize] <= mv {
                if nums[left as usize] <= target && target < mv {
                    right = mid - 1;
                } else {
                    left = mid + 1;
                }
            } else if mv < target && target <= nums[right as usize] {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        false
    }
}
