impl Solution {
    pub fn find_redundant_directed_connection(edges: Vec<Vec<i32>>) -> Vec<i32> {
        let n = edges.len();
        let mut uf_parent: Vec<usize> = (0..=n).collect();
        let mut rank = vec![0usize; n + 1];
        let mut parent_arr = vec![0usize; n + 1];
        
        fn find(uf_parent: &mut Vec<usize>, u: usize) -> usize {
            if uf_parent[u] != u {
                uf_parent[u] = find(uf_parent, uf_parent[u]);
            }
            uf_parent[u]
        }
        
        fn union(uf_parent: &mut Vec<usize>, rank: &mut Vec<usize>, u: usize, v: usize) -> bool {
            let pu = find(uf_parent, u);
            let pv = find(uf_parent, v);
            if pu == pv { return false; }
            if rank[pu] < rank[pv] {
                uf_parent[pu] = pv;
            } else if rank[pv] < rank[pu] {
                uf_parent[pv] = pu;
            } else {
                uf_parent[pu] = pv;
                rank[pv] += 1;
            }
            true
        }
        
        let mut candidate1: Option<Vec<i32>> = None;
        let mut candidate2: Option<Vec<i32>> = None;
        
        for edge in &edges {
            let u = edge[0] as usize;
            let v = edge[1] as usize;
            if parent_arr[v] != 0 {
                candidate1 = Some(vec![parent_arr[v] as i32, v as i32]);
                candidate2 = Some(vec![u as i32, v as i32]);
                break;
            }
            parent_arr[v] = u;
        }
        
        for edge in &edges {
            let u = edge[0] as usize;
            let v = edge[1] as usize;
            if let Some(ref c2) = candidate2 {
                if u as i32 == c2[0] && v as i32 == c2[1] {
                    continue;
                }
            }
            if !union(&mut uf_parent, &mut rank, u, v) {
                return candidate1.unwrap_or_else(|| vec![u as i32, v as i32]);
            }
        }
        
        candidate2.unwrap()
    }
}
