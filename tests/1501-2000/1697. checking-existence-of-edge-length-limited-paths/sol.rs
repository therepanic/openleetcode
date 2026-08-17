impl Solution {
    pub fn distance_limited_paths_exist(n: i32, edge_list: Vec<Vec<i32>>, queries: Vec<Vec<i32>>) -> Vec<bool> {
        let mut parent: Vec<usize> = (0..n as usize).collect();
        let mut rank: Vec<usize> = vec![0; n as usize];
        
        fn find(parent: &mut Vec<usize>, x: usize) -> usize {
            if parent[x] != x {
                parent[x] = find(parent, parent[x]);
            }
            parent[x]
        }
        
        fn union(parent: &mut Vec<usize>, rank: &mut Vec<usize>, x: usize, y: usize) {
            let xroot = find(parent, x);
            let yroot = find(parent, y);
            if xroot == yroot { return; }
            if rank[xroot] < rank[yroot] {
                parent[xroot] = yroot;
            } else if rank[xroot] > rank[yroot] {
                parent[yroot] = xroot;
            } else {
                parent[yroot] = xroot;
                rank[xroot] += 1;
            }
        }
        
        // add index to queries
        let mut queries_with_idx: Vec<Vec<i32>> = Vec::new();
        for (i, q) in queries.iter().enumerate() {
            queries_with_idx.push(vec![q[0], q[1], q[2], i as i32]);
        }
        
        queries_with_idx.sort_by(|a, b| a[2].cmp(&b[2]));
        let mut sorted_edges = edge_list.clone();
        sorted_edges.sort_by(|a, b| a[2].cmp(&b[2]));
        
        let mut idx = 0;
        let mut res = vec![false; queries.len()];
        for q in queries_with_idx {
            while idx < sorted_edges.len() && sorted_edges[idx][2] < q[2] {
                union(&mut parent, &mut rank, sorted_edges[idx][0] as usize, sorted_edges[idx][1] as usize);
                idx += 1;
            }
            if find(&mut parent, q[0] as usize) == find(&mut parent, q[1] as usize) {
                res[q[3] as usize] = true;
            }
        }
        res
    }
}
