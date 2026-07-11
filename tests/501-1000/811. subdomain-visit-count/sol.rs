impl Solution {
    pub fn subdomain_visits(cpdomains: Vec<String>) -> Vec<String> {
        let mut freq = std::collections::HashMap::new();
        for entry in &cpdomains {
            let mut parts = entry.split_whitespace();
            let cnt: i32 = parts.next().unwrap().parse().unwrap();
            let dom = parts.next().unwrap();
            let sub_parts: Vec<&str> = dom.split('.').collect();
            for i in 0..sub_parts.len() {
                let sub = sub_parts[i..].join(".");
                *freq.entry(sub).or_insert(0) += cnt;
            }
        }
        freq.into_iter()
            .map(|(d, c)| format!("{} {}", c, d))
            .collect()
    }
}
