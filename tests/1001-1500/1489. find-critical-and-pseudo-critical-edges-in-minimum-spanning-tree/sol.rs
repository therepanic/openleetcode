impl Solution {
    pub fn find_critical_and_pseudo_critical_edges(n: i32, edges: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        struct UnionFind {
            parent: Vec<usize>,
        }
        impl UnionFind {
            fn new(n: usize) -> Self {
                UnionFind { parent: (0..n).collect() }
            }
            fn find_parent(&mut self, p: usize) -> usize {
                if self.parent[p] == p {
                    return p;
                }
                self.parent[p] = self.find_parent(self.parent[p]);
                self.parent[p]
            }
            fn union(&mut self, u: usize, v: usize) {
                let pu = self.find_parent(u);
                let pv = self.find_parent(v);
                self.parent[pu] = pv;
            }
        }

        fn find_mst(n: usize, edges: &Vec<Vec<usize>>, block: i32, e: i32) -> i32 {
            let mut uf = UnionFind::new(n);
            let mut weight = 0;
            if e != -1 {
                let e = e as usize;
                weight += edges[e][2] as i32;
                uf.union(edges[e][0], edges[e][1]);
            }
            for i in 0..edges.len() {
                if i as i32 == block {
                    continue;
                }
                if uf.find_parent(edges[i][0]) == uf.find_parent(edges[i][1]) {
                    continue;
                }
                uf.union(edges[i][0], edges[i][1]);
                weight += edges[i][2] as i32;
            }
            for i in 0..n {
                if uf.find_parent(i) != uf.find_parent(0) {
                    return i32::MAX;
                }
            }
            weight
        }

        let n = n as usize;
        let mut edges_with_idx: Vec<Vec<usize>> = edges.iter().enumerate().map(|(i, e)| {
            vec![e[0] as usize, e[1] as usize, e[2] as usize, i]
        }).collect();
        edges_with_idx.sort_by(|a, b| a[2].cmp(&b[2]));
        let mstwt = find_mst(n, &edges_with_idx, -1, -1);
        let mut critical = vec![];
        let mut pseudo_critical = vec![];
        for i in 0..edges_with_idx.len() {
            if mstwt < find_mst(n, &edges_with_idx, i as i32, -1) {
                critical.push(edges_with_idx[i][3] as i32);
            } else if mstwt == find_mst(n, &edges_with_idx, -1, i as i32) {
                pseudo_critical.push(edges_with_idx[i][3] as i32);
            }
        }
        vec![critical, pseudo_critical]
    }
}
