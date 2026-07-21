impl Solution {
    pub fn min_jumps(arr: Vec<i32>) -> i32 {
        let n = arr.len();
        if n == 1 {
            return 0;
        }
        
        use std::collections::{HashMap, VecDeque};
        let mut mp: HashMap<i32, Vec<usize>> = HashMap::new();
        for i in 0..n {
            mp.entry(arr[i]).or_insert_with(Vec::new).push(i);
        }
        
        let mut q = VecDeque::new();
        q.push_back((0usize, 0i32));
        let mut vis = vec![false; n];
        vis[0] = true;
        
        while let Some((node, dist)) = q.pop_front() {
            if node == n - 1 {
                return dist;
            }
            
            if node > 0 && !vis[node - 1] {
                vis[node - 1] = true;
                q.push_back((node - 1, dist + 1));
            }
            if node + 1 < n && !vis[node + 1] {
                vis[node + 1] = true;
                q.push_back((node + 1, dist + 1));
            }
            
            if let Some(indices) = mp.get(&arr[node]) {
                for &nxt in indices {
                    if !vis[nxt] {
                        vis[nxt] = true;
                        q.push_back((nxt, dist + 1));
                    }
                }
                mp.get_mut(&arr[node]).unwrap().clear();
            }
        }
        -1
    }
}
