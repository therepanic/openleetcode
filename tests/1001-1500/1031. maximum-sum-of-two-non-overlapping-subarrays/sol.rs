impl Solution {
    pub fn max_sum_two_no_overlap(nums: Vec<i32>, first_len: i32, second_len: i32) -> i32 {
        std::cmp::max(
            solve(&nums, first_len as usize, second_len as usize),
            solve(&nums, second_len as usize, first_len as usize),
        )
    }
}

fn solve(nums: &Vec<i32>, first_len: usize, second_len: usize) -> i32 {
    let n = nums.len();
    let mut prefix = vec![0; n + 1];
    for i in 0..n {
        prefix[i + 1] = prefix[i] + nums[i];
    }
    let mut best_a = prefix[first_len];
    let mut ans = 0;
    for end in first_len + second_len..=n {
        best_a = std::cmp::max(best_a, prefix[end - second_len] - prefix[end - second_len - first_len]);
        ans = std::cmp::max(ans, best_a + prefix[end] - prefix[end - second_len]);
    }
    ans
}
