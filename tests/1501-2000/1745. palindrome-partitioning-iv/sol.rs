impl Solution {
    pub fn check_partitioning(s: String) -> bool {
        let s: Vec<char> = s.chars().collect();
        let n = s.len();
        let mut pal = vec![vec![false; n]; n];
        for i in 0..n {
            pal[i][i] = true;
        }
        for length in 2..=n {
            for i in 0..=n-length {
                let j = i + length - 1;
                if s[i] == s[j] && (length == 2 || pal[i+1][j-1]) {
                    pal[i][j] = true;
                }
            }
        }
        for i in 0..n-2 {
            if pal[0][i] {
                for j in i+1..n-1 {
                    if pal[i+1][j] && pal[j+1][n-1] {
                        return true;
                    }
                }
            }
        }
        false
    }
}
