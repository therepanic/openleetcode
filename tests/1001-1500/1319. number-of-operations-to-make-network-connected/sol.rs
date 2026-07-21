impl Solution {
    pub fn make_connected(n: i32, connections: Vec<Vec<i32>>) -> i32 {
        let n = n as usize;
        if connections.len() < n - 1 {
            return -1;
        }

        let mut parent: Vec<usize> = (0..n).collect();
        let mut size: Vec<usize> = vec![1; n];

        fn find(parent: &mut Vec<usize>, node: usize) -> usize {
            if parent[node] != node {
                parent[node] = find(parent, parent[node]);
            }
            parent[node]
        }

        fn union(parent: &mut Vec<usize>, size: &mut Vec<usize>, u: usize, v: usize) {
            let pu = find(parent, u);
            let pv = find(parent, v);
            if pu == pv {
                return;
            }
            if size[pu] < size[pv] {
                parent[pu] = pv;
                size[pv] += size[pu];
            } else {
                parent[pv] = pu;
                size[pu] += size[pv];
            }
        }

        let mut extra = 0;
        for conn in &connections {
            let u = conn[0] as usize;
            let v = conn[1] as usize;
            if find(&mut parent, u) == find(&mut parent, v) {
                extra += 1;
            } else {
                union(&mut parent, &mut size, u, v);
            }
        }

        let components = (0..n).filter(|&i| find(&mut parent, i) == i).count() as i32;

        if extra >= components - 1 {
            components - 1
        } else {
            -1
        }
    }
}
