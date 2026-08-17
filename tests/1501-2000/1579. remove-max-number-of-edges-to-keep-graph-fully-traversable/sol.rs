impl Solution {
    pub fn max_num_edges_to_remove(n: i32, edges: Vec<Vec<i32>>) -> i32 {
        let n = n as usize;
        let mut edges = edges;
        edges.sort_by(|a, b| b[0].cmp(&a[0]));
        let mut parentA = (0..=n).collect::<Vec<_>>();
        let mut parentB = (0..=n).collect::<Vec<_>>();
        let mut rankA = vec![0; n + 1];
        let mut rankB = vec![0; n + 1];

        fn find(parent: &mut Vec<usize>, x: usize) -> usize {
            if parent[x] != x {
                parent[x] = find(parent, parent[x]);
            }
            parent[x]
        }

        fn union_set(parent: &mut Vec<usize>, rank: &mut Vec<i32>, x: usize, y: usize) -> bool {
            let root_x = find(parent, x);
            let root_y = find(parent, y);
            if root_x == root_y { return false; }
            if rank[root_x] < rank[root_y] {
                parent[root_x] = root_y;
            } else if rank[root_x] > rank[root_y] {
                parent[root_y] = root_x;
            } else {
                parent[root_x] = root_y;
                rank[root_y] += 1;
            }
            true
        }

        let mut removed = 0;
        let mut alice_edges = 0;
        let mut bob_edges = 0;
        for e in edges {
            let (t, u, v) = (e[0] as usize, e[1] as usize, e[2] as usize);
            if t == 3 {
                if union_set(&mut parentA, &mut rankA, u, v) {
                    union_set(&mut parentB, &mut rankB, u, v);
                    alice_edges += 1;
                    bob_edges += 1;
                } else {
                    removed += 1;
                }
            } else if t == 2 {
                if union_set(&mut parentB, &mut rankB, u, v) {
                    bob_edges += 1;
                } else {
                    removed += 1;
                }
            } else {
                if union_set(&mut parentA, &mut rankA, u, v) {
                    alice_edges += 1;
                } else {
                    removed += 1;
                }
            }
        }
        if bob_edges == n as i32 - 1 && alice_edges == n as i32 - 1 { removed } else { -1 }
    }
}
