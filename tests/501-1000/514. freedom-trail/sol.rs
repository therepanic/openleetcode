impl Solution {
    pub fn find_rotate_steps(ring: String, key: String) -> i32 {
        fn dist(size: i32, p: i32, t: i32) -> i32 {
            let diff = (t - p).abs();
            diff.min(size - diff)
        }
        
        let ring = ring.as_bytes();
        let key = key.as_bytes();
        let n = ring.len() as i32;
        let m = key.len();
        
        let mut mp = vec![[0usize; 100]; 26];
        let mut freq = vec![0usize; 26];
        let mut dp = vec![vec![0i32; 100]; 100];
        
        for i in 0..ring.len() {
            let idx = (ring[i] - b'a') as usize;
            mp[idx][freq[idx]] = i;
            freq[idx] += 1;
        }
        
        let first_char = (key[0] - b'a') as usize;
        for i in 0..freq[first_char] {
            dp[0][mp[first_char][i]] = dist(n, 0, mp[first_char][i] as i32) + 1;
        }
        
        for i in 1..m {
            let prev_char = (key[i - 1] - b'a') as usize;
            let curr_char = (key[i] - b'a') as usize;
            for j in 0..freq[curr_char] {
                let mut mini = i32::MAX;
                for k in 0..freq[prev_char] {
                    mini = mini.min(
                        dp[i - 1][mp[prev_char][k]] +
                        dist(n, mp[curr_char][j] as i32, mp[prev_char][k] as i32) + 1
                    );
                }
                dp[i][mp[curr_char][j]] = mini;
            }
        }
        
        let last_char = (key[m - 1] - b'a') as usize;
        let mut res = i32::MAX;
        for i in 0..freq[last_char] {
            res = res.min(dp[m - 1][mp[last_char][i]]);
        }
        
        res
    }
}
