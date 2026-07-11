impl Solution {
    pub fn garden_no_adj(n: i32, paths: Vec<Vec<i32>>) -> Vec<i32> {
        use std::collections::{HashMap, HashSet};
        
        let mut graph: HashMap<i32, Vec<i32>> = HashMap::new();
        
        for path in &paths {
            let u = path[0];
            let v = path[1];
            graph.entry(u).or_insert_with(Vec::new).push(v);
            graph.entry(v).or_insert_with(Vec::new).push(u);
        }
        
        for node in 1..=n {
            graph.entry(node).or_insert_with(Vec::new);
        }
        
        let mut answer = vec![0; (n + 1) as usize];
        
        for i in 1..=n {
            let mut used = HashSet::new();
            if let Some(neighbors) = graph.get(&i) {
                for &nei in neighbors {
                    used.insert(answer[nei as usize]);
                }
            }
            
            for flower in 1..=4 {
                if !used.contains(&flower) {
                    answer[i as usize] = flower;
                    break;
                }
            }
        }
        
        answer[1..].to_vec()
    }
}
