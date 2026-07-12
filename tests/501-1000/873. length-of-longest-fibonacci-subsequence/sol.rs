impl Solution {
    pub fn len_longest_fib_subseq(arr: Vec<i32>) -> i32 {
        let n = arr.len();
        let mut dp = vec![vec![0; n]; n];
        let mut max_len = 0;
        
        for curr in 2..n {
            let mut start = 0;
            let mut end = curr - 1;
            
            while start < end {
                let pair_sum = arr[start] + arr[end];
                
                if pair_sum > arr[curr] {
                    end -= 1;
                } else if pair_sum < arr[curr] {
                    start += 1;
                } else {
                    dp[end][curr] = dp[start][end] + 1;
                    max_len = max_len.max(dp[end][curr]);
                    end -= 1;
                    start += 1;
                }
            }
        }
        
        if max_len > 0 { max_len + 2 } else { 0 }
    }
}
