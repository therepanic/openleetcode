impl Solution {
    pub fn search_range(nums: Vec<i32>, target: i32) -> Vec<i32> {
        fn bound(nums: &[i32], target: i32, left: bool) -> i32 {
            let mut low: i32 = 0;
            let mut high: i32 = nums.len() as i32 - 1;
            let mut ans = -1;

            while low <= high {
                let mid = low + (high - low) / 2;
                let m = mid as usize;
                if nums[m] < target {
                    low = mid + 1;
                } else if nums[m] > target {
                    high = mid - 1;
                } else {
                    ans = mid;
                    if left {
                        high = mid - 1;
                    } else {
                        low = mid + 1;
                    }
                }
            }

            ans
        }

        vec![bound(&nums, target, true), bound(&nums, target, false)]
    }
}
