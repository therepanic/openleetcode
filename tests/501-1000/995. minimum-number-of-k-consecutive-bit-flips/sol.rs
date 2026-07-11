impl Solution {
    pub fn min_k_bit_flips(nums: Vec<i32>, k: i32) -> i32 {
        let n = nums.len();
        let k = k as usize;
        let mut ans = 0;
        let mut flips = 0;
        let mut flipped = vec![0i32; n + 1];

        for i in 0..=n - k {
            flips += flipped[i];
            if (nums[i] == 0 && flips % 2 == 0) || (nums[i] == 1 && flips % 2 != 0) {
                flips += 1;
                ans += 1;
                flipped[i + k] -= 1;
            }
        }

        for i in n - k + 1..n {
            flips += flipped[i];
            if (nums[i] == 0 && flips % 2 == 0) || (nums[i] == 1 && flips % 2 != 0) {
                return -1;
            }
        }

        ans
    }
}
