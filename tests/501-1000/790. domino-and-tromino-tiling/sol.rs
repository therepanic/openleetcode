impl Solution {
    const MOD: i64 = 1_000_000_007;

    fn multiply(a: &[[i64; 3]; 3], b: &[[i64; 3]; 3]) -> [[i64; 3]; 3] {
        let mut c = [[0i64; 3]; 3];
        for i in 0..3 {
            for j in 0..3 {
                let mut s = 0i64;
                for k in 0..3 {
                    s = (s + a[i][k] * b[k][j]) % Self::MOD;
                }
                c[i][j] = s;
            }
        }
        c
    }

    fn power(mut base: [[i64; 3]; 3], mut exp: i32) -> [[i64; 3]; 3] {
        let mut result = [[1,0,0],[0,1,0],[0,0,1]];
        while exp > 0 {
            if exp & 1 == 1 {
                result = Self::multiply(&result, &base);
            }
            base = Self::multiply(&base, &base);
            exp >>= 1;
        }
        result
    }

    pub fn num_tilings(n: i32) -> i32 {
        if n == 0 { return 1; }
        if n == 1 { return 1; }
        if n == 2 { return 2; }
        let t = [[2,0,1],[1,0,0],[0,1,0]];
        let p = Self::power(t, n - 2);
        ((p[0][0] * 2 + p[0][1] + p[0][2]) % Self::MOD) as i32
    }
}
