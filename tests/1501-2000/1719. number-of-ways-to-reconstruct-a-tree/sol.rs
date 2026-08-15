impl Solution {
    pub fn check_ways(pairs: Vec<Vec<i32>>) -> i32 {
        use std::collections::{HashMap, HashSet};
        let mut graph: HashMap<i32, HashSet<i32>> = HashMap::new();
        for p in &pairs {
            graph.entry(p[0]).or_insert_with(HashSet::new).insert(p[1]);
            graph.entry(p[1]).or_insert_with(HashSet::new).insert(p[0]);
        }
        if graph.is_empty() { return 0; }
        let root = *graph.iter().max_by_key(|(_, v)| v.len()).unwrap().0;
        if graph[&root].len() != graph.len() - 1 { return 0; }

        let mut ans = 1;
        for (&node, neighbors) in &graph {
            if node == root { continue; }
            let parents: Vec<i32> = neighbors.iter().filter(|&&cand| graph[&cand].len() >= neighbors.len()).cloned().collect();
            if parents.is_empty() { return 0; }
            let parent = parents.iter().min_by_key(|&&cand| graph[&cand].len()).unwrap();
            let union: HashSet<i32> = graph[parent].iter().cloned().collect::<HashSet<_>>().union(&HashSet::from([*parent])).cloned().collect();
            for n in neighbors {
                if !union.contains(n) { return 0; }
            }
            if neighbors.len() == graph[parent].len() { ans = 2; }
        }
        ans
    }
}
