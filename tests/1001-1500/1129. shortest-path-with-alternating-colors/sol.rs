impl Solution {
    pub fn shortest_alternating_paths(n: i32, red_edges: Vec<Vec<i32>>, blue_edges: Vec<Vec<i32>>) -> Vec<i32> {
        let n = n as usize;
        let mut ans = vec![-1; n];
        let mut graph: Vec<Vec<(i32, i32)>> = vec![vec![]; n]; // (to, color): 1=red, 2=blue
        
        for e in &red_edges {
            graph[e[0] as usize].push((e[1], 1));
        }
        for e in &blue_edges {
            graph[e[0] as usize].push((e[1], 2));
        }
        
        let mut q = std::collections::VecDeque::new();
        q.push_back((0, 0)); // (node, prevColor): 0=init
        
        let mut step = 0;
        while !q.is_empty() {
            let size = q.len();
            for _ in 0..size {
                let (u, prev_color) = q.pop_front().unwrap();
                let u = u as usize;
                if ans[u] == -1 {
                    ans[u] = step;
                }
                let neighbors = graph[u].clone();
                for (j, (v, edge_color)) in neighbors.iter().enumerate() {
                    if *v == -1 || *edge_color == prev_color {
                        continue;
                    }
                    q.push_back((*v as usize, *edge_color));
                    graph[u][j] = (-1, *edge_color);
                }
            }
            step += 1;
        }
        ans
    }
}
