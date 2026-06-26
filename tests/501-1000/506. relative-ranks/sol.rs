impl Solution {
    pub fn find_relative_ranks(score: Vec<i32>) -> Vec<String> {
        let n = score.len();
        let mut sorted = score.clone();
        sorted.sort_by(|a, b| b.cmp(a));
        use std::collections::HashMap;
        let mut ranks: HashMap<i32, String> = HashMap::new();
        for i in 0..n {
            ranks.insert(sorted[i], (i + 1).to_string());
        }
        ranks.insert(sorted[0], "Gold Medal".to_string());
        if n > 1 {
            ranks.insert(sorted[1], "Silver Medal".to_string());
        }
        if n > 2 {
            ranks.insert(sorted[2], "Bronze Medal".to_string());
        }
        score.iter().map(|s| ranks.get(s).unwrap().clone()).collect()
    }
}
