impl Solution {
    pub fn eventual_safe_nodes(graph: Vec<Vec<i32>>) -> Vec<i32> {
        let n = graph.len();
        let mut state = vec![0; n]; // 0: unvisited, 1: visiting, 2: safe
        let mut safe = Vec::new();
        
        fn dfs(node: usize, graph: &Vec<Vec<i32>>, state: &mut Vec<i32>) -> bool {
            if state[node] > 0 {
                return state[node] == 2;
            }
            
            state[node] = 1;
            
            for &neighbor in &graph[node] {
                let neighbor = neighbor as usize;
                if state[neighbor] == 1 || !dfs(neighbor, graph, state) {
                    return false;
                }
            }
            
            state[node] = 2;
            true
        }
        
        for i in 0..n {
            if dfs(i, &graph, &mut state) {
                safe.push(i as i32);
            }
        }
        
        safe
    }
}
