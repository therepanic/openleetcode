impl Solution {
    pub fn die_simulator(n: i32, roll_max: Vec<i32>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let faces = 6;
        let n = n as usize;

        let mut f = vec![vec![0i64; faces]; n];
        let mut s = vec![0i64; n];

        for j in 0..faces {
            f[0][j] = 1;
        }
        s[0] = faces as i64;

        for i in 1..n {
            for j in 0..faces {
                let max_repeat = roll_max[j] as usize;
                let mut res = s[i - 1];

                if i > max_repeat {
                    res -= s[i - max_repeat - 1] - f[i - max_repeat - 1][j];
                } else if i == max_repeat {
                    res -= 1;
                }

                f[i][j] = ((res % MOD) + MOD) % MOD;
            }

            let mut sum: i64 = 0;
            for j in 0..faces {
                sum = (sum + f[i][j]) % MOD;
            }
            s[i] = sum;
        }

        s[n - 1] as i32
    }
}
