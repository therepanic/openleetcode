impl Solution {
    pub fn smallest_divisor(nums: Vec<i32>, threshold: i32) -> i32 {
        let mut low = 1;
        let mut high = *nums.iter().max().unwrap();
        let mut ans = high;

        while low <= high {
            let mid = low + (high - low) / 2;

            let mut total: i64 = 0;
            for &num in &nums {
                total += ((num as i64 + mid as i64 - 1) / mid as i64);
            }

            if total <= threshold as i64 {
                ans = mid;
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }

        ans
    }
}
