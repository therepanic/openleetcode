impl Solution {
    pub fn min_abs_difference(nums: Vec<i32>, goal: i32) -> i32 {
        fn sums(values: &[i32]) -> Vec<i32> {
            let mut result = vec![0];
            for &value in values {
                let current_len = result.len();
                for i in 0..current_len {
                    result.push(result[i] + value);
                }
            }
            result
        }
        let mid = nums.len() / 2;
        let mut left = sums(&nums[..mid]);
        let mut right = sums(&nums[mid..]);
        left.sort();
        right.sort();
        let mut answer = (goal).abs();
        let mut j = right.len() - 1;
        for &value in &left {
            while j > 0 && right[j - 1] >= goal - value {
                j -= 1;
            }
            answer = answer.min((value + right[j] - goal).abs());
            if j > 0 {
                answer = answer.min((value + right[j - 1] - goal).abs());
            }
        }
        answer
    }
}
