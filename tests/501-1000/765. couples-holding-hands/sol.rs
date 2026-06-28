impl Solution {
    pub fn min_swaps_couples(row: Vec<i32>) -> i32 {
        let n = row.len() / 2;
        let mut parent: Vec<usize> = (0..n).collect();
        
        fn find(parent: &mut Vec<usize>, x: usize) -> usize {
            if parent[x] != x {
                parent[x] = find(parent, parent[x]);
            }
            parent[x]
        }
        
        fn union(parent: &mut Vec<usize>, a: usize, b: usize) {
            let pa = find(parent, a);
            let pb = find(parent, b);
            if pa != pb {
                parent[pa] = pb;
            }
        }
        
        for i in (0..row.len()).step_by(2) {
            let couple1 = (row[i] / 2) as usize;
            let couple2 = (row[i+1] / 2) as usize;
            union(&mut parent, couple1, couple2);
        }
        
        let mut component_size = vec![0; n];
        for couple in 0..n {
            let root = find(&mut parent, couple);
            component_size[root] += 1;
        }
        
        let mut swaps = 0;
        for size in component_size {
            if size > 0 {
                swaps += size - 1;
            }
        }
        
        swaps
    }
}
