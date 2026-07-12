impl Solution {
    pub fn shortest_alternating_paths(n: i32, red_edges: Vec<Vec<i32>>, blue_edges: Vec<Vec<i32>>) -> Vec<i32> {
        let n = n as usize;
        let mut ans = vec![-1; n];
        let mut graph: Vec<Vec<(i32, i32)>> = vec![Vec::new(); n];
        let mut q = std::collections::VecDeque::new();
        q.push_back((0i32, 0i32)); // (node, prevColor): 0-init, 1-red, 2-blue
        
        for edge in &red_edges {
            graph[edge[0] as usize].push((edge[1], 1));
        }
        for edge in &blue_edges {
            graph[edge[0] as usize].push((edge[1], 2));
        }
        
        let mut step = 0;
        while !q.is_empty() {
            let size = q.len();
            for _ in 0..size {
                let (u, prev_color) = q.pop_front().unwrap();
                let uu = u as usize;
                if ans[uu] == -1 {
                    ans[uu] = step;
                }
                for i in 0..graph[uu].len() {
                    let (v, edge_color) = graph[uu][i];
                    if v == -1 || edge_color == prev_color {
                        continue;
                    }
                    q.push_back((v, edge_color));
                    graph[uu][i] = (-1, edge_color);
                }
            }
            step += 1;
        }
        ans
    }
}
