impl Solution {
    pub fn count_vowel_permutation(n: i32) -> i32 {
        const MOD: i32 = 1_000_000_007;
        let mut a = 1;
        let mut e = 1;
        let mut i = 1;
        let mut o = 1;
        let mut u = 1;
        for _ in 1..n {
            let na = ((e + i) % MOD + u) % MOD;
            let ne = (a + i) % MOD;
            let ni = (e + o) % MOD;
            let no = i % MOD;
            let nu = (i + o) % MOD;
            a = na;
            e = ne;
            i = ni;
            o = no;
            u = nu;
        }
        ((((a + e) % MOD + i) % MOD + o) % MOD + u) % MOD
    }
}
