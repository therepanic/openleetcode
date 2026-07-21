impl Solution {
    pub fn num_subseq(nums: Vec<i32>, target: i32) -> i32 {
        let modulo: i32 = 1_000_000_007;
        let mut values = nums;
        values.sort_unstable();
        let n = values.len();

        let mut power = vec![1; n];
        for i in 1..n {
            power[i] = (power[i - 1] * 2) % modulo;
        }

        let mut left = 0;
        let mut right = n as i32 - 1;
        let mut result = 0;

        while left <= right {
            if values[left as usize] + values[right as usize] <= target {
                result = (result + power[(right - left) as usize]) % modulo;
                left += 1;
            } else {
                right -= 1;
            }
        }

        result
    }
}
