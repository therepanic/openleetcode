impl Solution {
    pub fn minimum_hamming_distance(source: Vec<i32>, target: Vec<i32>, allowed_swaps: Vec<Vec<i32>>) -> i32 {
        let n = source.len();
        let mut parent: Vec<usize> = (0..n).collect();
        
        fn find(parent: &mut Vec<usize>, x: usize) -> usize {
            if parent[x] != x {
                parent[x] = find(parent, parent[x]);
            }
            parent[x]
        }
        
        fn unite(parent: &mut Vec<usize>, a: usize, b: usize) {
            let ra = find(parent, a);
            let rb = find(parent, b);
            parent[ra] = rb;
        }
        
        for swap in allowed_swaps {
            unite(&mut parent, swap[0] as usize, swap[1] as usize);
        }
        
        use std::collections::HashMap;
        let mut groups: HashMap<usize, Vec<i32>> = HashMap::new();
        for i in 0..n {
            let root = find(&mut parent, i);
            groups.entry(root).or_insert(Vec::new()).push(source[i]);
        }
        let mut freq_map: HashMap<usize, HashMap<i32, i32>> = HashMap::new();
        for (root, vals) in groups {
            let mut freq = HashMap::new();
            for v in vals {
                *freq.entry(v).or_insert(0) += 1;
            }
            freq_map.insert(root, freq);
        }
        
        let mut hamming_dist = 0;
        for i in 0..n {
            let root = find(&mut parent, i);
            let freq = freq_map.get_mut(&root).unwrap();
            let val = target[i];
            let count = freq.entry(val).or_insert(0);
            if *count > 0 {
                *count -= 1;
            } else {
                hamming_dist += 1;
            }
        }
        hamming_dist
    }
}
