impl Solution {
    pub fn shortest_path_length(graph: Vec<Vec<i32>>) -> i32 {
        let n = graph.len();
        if n == 1 {
            return 0;
        }
        
        let full = (1 << n) - 1;
        let mut visited = vec![vec![false; 1 << n]; n];
        let mut queue = std::collections::VecDeque::new();
        
        for i in 0..n {
            let mask = 1 << i;
            queue.push_back((i, mask, 0));
            visited[i][mask] = true;
        }
        
        while let Some((node, mask, dist)) = queue.pop_front() {
            if mask == full {
                return dist;
            }
            
            for &nei in &graph[node] {
                let nei = nei as usize;
                let new_mask = mask | (1 << nei);
                
                if !visited[nei][new_mask] {
                    visited[nei][new_mask] = true;
                    queue.push_back((nei, new_mask, dist + 1));
                }
            }
        }
        
        -1
    }
}
