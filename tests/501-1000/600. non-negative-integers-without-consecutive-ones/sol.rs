impl Solution {
    pub fn find_integers(n: i32) -> i32 {
        let mut f = vec![0; 30];
        f[0] = 1;
        f[1] = 2;
        for i in 2..30 {
            f[i] = f[i - 1] + f[i - 2];
        }
        
        let mut ans = 0;
        let mut last_seen = 0;
        for i in (0..30).rev() {
            if (1 << i) & n != 0 {
                ans += f[i];
                if last_seen == 1 {
                    ans -= 1;
                    break;
                }
                last_seen = 1;
            } else {
                last_seen = 0;
            }
        }
        ans + 1
    }
}
