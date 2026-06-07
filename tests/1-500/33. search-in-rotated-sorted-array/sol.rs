impl Solution {
    pub fn search(nums: Vec<i32>, target: i32) -> i32 {
        if nums.is_empty() {
            return -1;
        }

        let mut low: i32 = 0;
        let mut high: i32 = nums.len() as i32 - 1;

        while low <= high {
            let mid = low + (high - low) / 2;
            let l = low as usize;
            let m = mid as usize;
            let h = high as usize;

            if nums[m] == target {
                return mid;
            }

            if nums[l] <= nums[m] {
                if nums[l] <= target && target < nums[m] {
                    high = mid - 1;
                } else {
                    low = mid + 1;
                }
            } else if nums[m] < target && target <= nums[h] {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }

        -1
    }
}
