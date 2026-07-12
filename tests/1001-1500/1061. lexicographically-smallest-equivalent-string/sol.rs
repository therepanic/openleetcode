impl Solution {
    pub fn smallest_equivalent_string(s1: String, s2: String, base_str: String) -> String {
        use std::collections::{HashMap, HashSet};
        
        let mut adj: HashMap<char, Vec<char>> = HashMap::new();
        for (a, b) in s1.chars().zip(s2.chars()) {
            adj.entry(a).or_default().push(b);
            adj.entry(b).or_default().push(a);
        }

        fn dfs(ch: char, visited: &mut HashSet<char>, adj: &HashMap<char, Vec<char>>) -> char {
            visited.insert(ch);
            let mut min_ch = ch;
            if let Some(neighbors) = adj.get(&ch) {
                for &nei in neighbors {
                    if !visited.contains(&nei) {
                        let candidate = dfs(nei, visited, adj);
                        if candidate < min_ch {
                            min_ch = candidate;
                        }
                    }
                }
            }
            min_ch
        }

        let mut result = String::new();
        for ch in base_str.chars() {
            let mut visited = HashSet::new();
            result.push(dfs(ch, &mut visited, &adj));
        }
        result
    }
}
