impl Solution {
    pub fn matrix_rank_transform(matrix: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let m = matrix.len();
        let n = matrix[0].len();
        let mut mp: std::collections::HashMap<i32, Vec<(usize, usize)>> = std::collections::HashMap::new();
        for i in 0..m {
            for j in 0..n {
                mp.entry(matrix[i][j]).or_default().push((i, j));
            }
        }
        
        let mut rank = vec![0; m+n];
        let mut ans = vec![vec![0; n]; m];
        
        let mut keys: Vec<i32> = mp.keys().cloned().collect();
        keys.sort();
        
        for k in keys {
            let mut parent: Vec<usize> = (0..m+n).collect();
            fn find(p: usize, parent: &mut Vec<usize>) -> usize {
                if p != parent[p] {
                    parent[p] = find(parent[p], parent);
                }
                parent[p]
            }
            
            for &(i, j) in &mp[&k] {
                let ii = find(i, &mut parent);
                let jj = find(m+j, &mut parent);
                parent[ii] = jj;
                if rank[ii] > rank[jj] { rank[jj] = rank[ii]; }
            }
            
            let mut seen = std::collections::HashSet::new();
            for &(i, j) in &mp[&k] {
                let ii = find(i, &mut parent);
                if !seen.contains(&ii) {
                    rank[ii] += 1;
                }
                seen.insert(ii);
                let v = rank[ii];
                rank[i] = v;
                rank[m+j] = v;
                ans[i][j] = v;
            }
        }
        ans
    }
}
