impl Solution {
    pub fn max_jumps(arr: Vec<i32>, d: i32) -> i32 {
        let n = arr.len();
        let d = d as usize;
        let mut order: Vec<usize> = (0..n).collect();
        order.sort_by_key(|&index| arr[index]);
        let mut dp = vec![1; n];
        for index in order {
            for step in 1..=d {
                if index < step || arr[index - step] >= arr[index] { break; }
                dp[index] = dp[index].max(dp[index - step] + 1);
            }
            for step in 1..=d {
                if index + step >= n || arr[index + step] >= arr[index] { break; }
                dp[index] = dp[index].max(dp[index + step] + 1);
            }
        }
        *dp.iter().max().unwrap()
    }
}
