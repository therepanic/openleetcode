impl Solution {
    pub fn smallest_string_with_swaps(s: String, pairs: Vec<Vec<i32>>) -> String {
        let n = s.len();
        let mut parent: Vec<usize> = (0..n).collect();
        let chars: Vec<char> = s.chars().collect();
        
        fn find(parent: &mut Vec<usize>, x: usize) -> usize {
            if parent[x] != x {
                parent[x] = find(parent, parent[x]);
            }
            parent[x]
        }
        
        fn union(parent: &mut Vec<usize>, x: usize, y: usize) {
            let rx = find(parent, x);
            let ry = find(parent, y);
            if rx != ry {
                parent[rx] = ry;
            }
        }
        
        for pair in &pairs {
            union(&mut parent, pair[0] as usize, pair[1] as usize);
        }
        
        use std::collections::HashMap;
        let mut groups: HashMap<usize, Vec<usize>> = HashMap::new();
        for i in 0..n {
            let root = find(&mut parent, i);
            groups.entry(root).or_insert_with(Vec::new).push(i);
        }
        
        let mut res: Vec<char> = vec![' '; n];
        for indices in groups.values() {
            let mut sorted_indices = indices.clone();
            sorted_indices.sort();
            let mut sorted_chars: Vec<char> = indices.iter().map(|&i| chars[i]).collect();
            sorted_chars.sort();
            for (idx, ch) in sorted_indices.iter().zip(sorted_chars.iter()) {
                res[*idx] = *ch;
            }
        }
        
        res.into_iter().collect()
    }
}
