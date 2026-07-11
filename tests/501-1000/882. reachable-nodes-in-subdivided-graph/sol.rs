impl Solution {
    pub fn reachable_nodes(edges: Vec<Vec<i32>>, max_moves: i32, n: i32) -> i32 {
        let n_usize = n as usize;
        let mut graph: Vec<Vec<(usize, i32)>> = vec![vec![]; n_usize];
        let mut dist: Vec<i32> = vec![max_moves + 1; n_usize];
        
        for edge in &edges {
            let u = edge[0] as usize;
            let v = edge[1] as usize;
            let cnt = edge[2];
            graph[u].push((v, cnt));
            graph[v].push((u, cnt));
        }
        
        fn dijkstra(graph: &Vec<Vec<(usize, i32)>>, max_moves: i32, dist: &mut Vec<i32>) -> i32 {
            use std::collections::BinaryHeap;
            use std::cmp::Reverse;
            
            dist[0] = 0;
            let mut heap = BinaryHeap::new();
            heap.push(Reverse((0, 0usize)));
            
            while let Some(Reverse((d, u))) = heap.pop() {
                if dist[u] >= max_moves {
                    break;
                }
                
                for &(v, w) in &graph[u] {
                    let new_dist = d + w + 1;
                    if new_dist < dist[v] {
                        dist[v] = new_dist;
                        heap.push(Reverse((new_dist, v)));
                    }
                }
            }
            
            dist.iter().filter(|&&d| d <= max_moves).count() as i32
        }
        
        let reachable_nodes = dijkstra(&graph, max_moves, &mut dist);
        let mut reachable_subnodes = 0i32;
        
        for edge in &edges {
            let u = edge[0] as usize;
            let v = edge[1] as usize;
            let cnt = edge[2];
            
            let a = if dist[u] > max_moves { 0 } else { (max_moves - dist[u]).min(cnt) };
            let b = if dist[v] > max_moves { 0 } else { (max_moves - dist[v]).min(cnt) };
            reachable_subnodes += (a + b).min(cnt);
        }
        
        reachable_nodes + reachable_subnodes
    }
}
