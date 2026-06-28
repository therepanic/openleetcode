impl Solution {
    pub fn is_bipartite(graph: Vec<Vec<i32>>) -> bool {
        let n = graph.len();
        let mut colors = vec![-1; n];
        
        fn check_bipartite(u: usize, curr_color: i32, colors: &mut Vec<i32>, graph: &Vec<Vec<i32>>) -> bool {
            colors[u] = curr_color;
            for &v in &graph[u] {
                let v = v as usize;
                if colors[v] == -1 {
                    if !check_bipartite(v, 1 - curr_color, colors, graph) {
                        return false;
                    }
                } else {
                    if colors[v] == curr_color {
                        return false;
                    }
                }
            }
            true
        }
        
        for u in 0..n {
            if colors[u] == -1 {
                if !check_bipartite(u, 0, &mut colors, &graph) {
                    return false;
                }
            }
        }
        true
    }
}
