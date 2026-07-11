impl Solution {
    pub fn shortest_superstring(words: Vec<String>) -> String {
        let n = words.len();
        let mut overlap = vec![vec![0; n]; n];
        
        fn get_overlap(a: &str, b: &str) -> usize {
            let mut max_olap = 0;
            for k in 1..=std::cmp::min(a.len(), b.len()) {
                if a[a.len()-k..] == b[..k] {
                    max_olap = std::cmp::max(max_olap, k);
                }
            }
            max_olap
        }
        
        for i in 0..n {
            for j in 0..n {
                if i != j {
                    overlap[i][j] = get_overlap(&words[i], &words[j]);
                }
            }
        }
        
        let total = 1 << n;
        let mut dp = vec![vec![String::new(); n]; total];
        for i in 0..n {
            dp[1 << i][i] = words[i].clone();
        }
        
        for mask in 0..total {
            for u in 0..n {
                if mask & (1 << u) == 0 {
                    continue;
                }
                for v in 0..n {
                    if mask & (1 << v) != 0 {
                        continue;
                    }
                    let new_mask = mask | (1 << v);
                    let candidate = format!("{}{}", dp[mask][u], &words[v][overlap[u][v]..]);
                    if dp[new_mask][v].is_empty() || candidate.len() < dp[new_mask][v].len() {
                        dp[new_mask][v] = candidate;
                    }
                }
            }
        }
        
        let mut shortest = String::new();
        for candidate in &dp[total - 1] {
            if shortest.is_empty() || candidate.len() < shortest.len() {
                shortest = candidate.clone();
            }
        }
        shortest
    }
}
