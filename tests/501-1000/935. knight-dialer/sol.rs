impl Solution {
    pub fn knight_dialer(n: i32) -> i32 {
        if n == 1 {
            return 10;
        }
        
        let mut dp = vec![1i32; 10];
        let mapping: Vec<Vec<usize>> = vec![
            vec![4, 6],
            vec![6, 8],
            vec![7, 9],
            vec![4, 8],
            vec![0, 3, 9],
            vec![],
            vec![0, 1, 7],
            vec![2, 6],
            vec![1, 3],
            vec![2, 4]
        ];
        
        let modulo = 1_000_000_007i32;
        
        for _ in 0..(n - 1) {
            let mut new_dp = vec![0i32; 10];
            for i in 0..10 {
                for &digit in &mapping[i] {
                    new_dp[digit] = (new_dp[digit] + dp[i]) % modulo;
                }
            }
            dp = new_dp;
        }
        
        dp.iter().fold(0, |acc, &x| (acc + x) % modulo)
    }
}
