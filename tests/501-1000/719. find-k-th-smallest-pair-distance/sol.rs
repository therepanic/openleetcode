impl Solution {
    pub fn smallest_distance_pair(nums: Vec<i32>, k: i32) -> i32 {
        let mut nums = nums;
        nums.sort();
        let n = nums.len();
        let mut low = 0;
        let mut high = nums[n - 1] - nums[0];

        while low < high {
            let mid = low + (high - low) / 2;
            let mut count = 0;
            let mut j = 0;
            for i in 0..n {
                while j < n && nums[j] - nums[i] <= mid {
                    j += 1;
                }
                count += j - i - 1;
            }
            if (count as i32) < k {
                low = mid + 1;
            } else {
                high = mid;
            }
        }
        low
    }
}
