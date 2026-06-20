use std::collections::{VecDeque, HashSet};

impl Solution {
    pub fn min_mutation(start_gene: String, end_gene: String, bank: Vec<String>) -> i32 {
        let s: HashSet<String> = bank.into_iter().collect();
        if !s.contains(&end_gene) && start_gene != end_gene {
            return -1;
        }
        let mut q = VecDeque::new();
        let mut v = HashSet::new();
        q.push_back((start_gene.clone(), 0));
        v.insert(start_gene);
        let choices = vec!['A', 'C', 'G', 'T'];
        while let Some((g, d)) = q.pop_front() {
            if g == end_gene {
                return d;
            }
            for i in 0..8 {
                for &c in &choices {
                    if g.as_bytes()[i] as char != c {
                        let mut n = g.clone();
                        n.replace_range(i..=i, &c.to_string());
                        if s.contains(&n) && !v.contains(&n) {
                            v.insert(n.clone());
                            q.push_back((n, d+1));
                        }
                    }
                }
            }
        }
        -1
    }
}
