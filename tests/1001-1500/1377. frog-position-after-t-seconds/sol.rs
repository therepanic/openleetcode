impl Solution {
    pub fn frog_position(n: i32, edges: Vec<Vec<i32>>, t: i32, target: i32) -> f64 {
        use std::collections::{HashMap, HashSet};
        
        let mut neighbors: HashMap<i32, HashSet<i32>> = HashMap::new();
        for i in 1..=n {
            neighbors.insert(i, HashSet::new());
        }
        for edge in edges {
            let a = edge[0];
            let b = edge[1];
            neighbors.get_mut(&a).unwrap().insert(b);
            neighbors.get_mut(&b).unwrap().insert(a);
        }
        
        fn dfs(
            vertex: i32,
            chance: f64,
            elapsed: i32,
            t: i32,
            target: i32,
            neighbors: &HashMap<i32, HashSet<i32>>,
            visited: &mut HashSet<i32>,
        ) -> f64 {
            if elapsed == t {
                return if vertex == target { chance } else { 0.0 };
            }
            visited.insert(vertex);
            let choices: Vec<i32> = neighbors[&vertex]
                .iter()
                .filter(|&&child| !visited.contains(&child))
                .cloned()
                .collect();
            
            if choices.is_empty() {
                return dfs(vertex, chance, elapsed + 1, t, target, neighbors, visited);
            } else {
                let probability = chance / choices.len() as f64;
                for child in choices {
                    let result = dfs(
                        child,
                        probability,
                        elapsed + 1,
                        t,
                        target,
                        neighbors,
                        visited,
                    );
                    if result > 0.0 {
                        return result;
                    }
                }
            }
            0.0
        }
        
        dfs(1, 1.0, 0, t, target, &neighbors, &mut HashSet::new())
    }
}
