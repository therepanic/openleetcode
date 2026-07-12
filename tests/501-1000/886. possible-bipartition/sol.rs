impl Solution {
    pub fn possible_bipartition(n: i32, dislikes: Vec<Vec<i32>>) -> bool {
        use std::collections::{HashMap, VecDeque};
        
        let n = n as usize;
        let mut graph: HashMap<usize, Vec<usize>> = HashMap::new();
        for edge in dislikes {
            let u = edge[0] as usize;
            let v = edge[1] as usize;
            graph.entry(u).or_insert_with(Vec::new).push(v);
            graph.entry(v).or_insert_with(Vec::new).push(u);
        }
        
        let mut color = vec![0; n + 1];
        
        for node in 1..=n {
            if color[node] != 0 || !graph.contains_key(&node) {
                continue;
            }
            
            let mut queue = VecDeque::new();
            queue.push_back(node);
            color[node] = 1;
            
            while let Some(curr) = queue.pop_front() {
                for &neighbor in graph[&curr].iter() {
                    if color[neighbor] == color[curr] {
                        return false;
                    }
                    
                    if color[neighbor] == 0 {
                        color[neighbor] = -color[curr];
                        queue.push_back(neighbor);
                    }
                }
            }
        }
        
        true
    }
}
