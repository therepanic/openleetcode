impl Solution {
    pub fn equations_possible(equations: Vec<String>) -> bool {
        let mut parent: Vec<usize> = (0..26).collect();
        let mut rank = vec![0usize; 26];

        fn find(parent: &mut Vec<usize>, x: usize) -> usize {
            if parent[x] != x {
                parent[x] = find(parent, parent[x]);
            }
            parent[x]
        }

        fn union(parent: &mut Vec<usize>, rank: &mut Vec<usize>, a: usize, b: usize) {
            let ra = find(parent, a);
            let rb = find(parent, b);
            if ra == rb {
                return;
            }
            if rank[ra] < rank[rb] {
                parent[ra] = rb;
            } else if rank[ra] > rank[rb] {
                parent[rb] = ra;
            } else {
                parent[rb] = ra;
                rank[ra] += 1;
            }
        }

        for eq in &equations {
            let bytes = eq.as_bytes();
            if bytes[1] == b'=' {
                let a = (bytes[0] - b'a') as usize;
                let b = (bytes[3] - b'a') as usize;
                union(&mut parent, &mut rank, a, b);
            }
        }

        for eq in &equations {
            let bytes = eq.as_bytes();
            if bytes[1] == b'!' {
                let a = (bytes[0] - b'a') as usize;
                let b = (bytes[3] - b'a') as usize;
                if find(&mut parent, a) == find(&mut parent, b) {
                    return false;
                }
            }
        }
        true
    }
}
