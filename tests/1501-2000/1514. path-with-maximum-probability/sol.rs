impl Solution {
    pub fn max_probability(n: i32, edges: Vec<Vec<i32>>, succ_prob: Vec<f64>, start_node: i32, end_node: i32) -> f64 {
        let n = n as usize;
        let mut dist = vec![0.0; n];
        dist[start_node as usize] = 1.0;
        
        for _ in 0..(n - 1) {
            let mut updated = false;
            for i in 0..edges.len() {
                let u = edges[i][0] as usize;
                let v = edges[i][1] as usize;
                if dist[u] * succ_prob[i] > dist[v] {
                    dist[v] = dist[u] * succ_prob[i];
                    updated = true;
                }
                if dist[v] * succ_prob[i] > dist[u] {
                    dist[u] = dist[v] * succ_prob[i];
                    updated = true;
                }
            }
            if !updated {
                break;
            }
        }
        
        dist[end_node as usize]
    }
}
