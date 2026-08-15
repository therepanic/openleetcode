impl Solution {
    pub fn get_coprimes(nums: Vec<i32>, edges: Vec<Vec<i32>>) -> Vec<i32> {
        let n = nums.len();
        let mut adj = vec![Vec::new(); n];
        for e in &edges {
            adj[e[0] as usize].push(e[1] as usize);
            adj[e[1] as usize].push(e[0] as usize);
        }
        let mut ans = vec![-1; n];
        let mut depth = vec![0; n];
        let mut ancestor_by_value = vec![-1i32; 51];
        Self::dfs(0, 0, 0, &nums, &adj, &mut ans, &mut depth, &mut ancestor_by_value);
        ans
    }
    
    fn dfs(node: usize, prev: usize, dep: i32, nums: &Vec<i32>, adj: &Vec<Vec<usize>>, ans: &mut Vec<i32>, depth: &mut Vec<i32>, ancestor_by_value: &mut Vec<i32>) {
        depth[node] = dep;
        let mut best = i32::MAX;
        let mut best_anc = -1;
        for i in 1..=50 {
            if Self::gcd(i, nums[node]) == 1 {
                let anc = ancestor_by_value[i as usize];
                if anc != -1 {
                    let diff = dep - depth[anc as usize];
                    if diff < best {
                        best = diff;
                        best_anc = anc;
                    }
                }
            }
        }
        ans[node] = best_anc;
        let prev_state = ancestor_by_value[nums[node] as usize];
        ancestor_by_value[nums[node] as usize] = node as i32;
        for &v in &adj[node] {
            if v != prev {
                Self::dfs(v, node, dep + 1, nums, adj, ans, depth, ancestor_by_value);
            }
        }
        ancestor_by_value[nums[node] as usize] = prev_state;
    }
    
    fn gcd(a: i32, b: i32) -> i32 {
        if b == 0 { a } else { Self::gcd(b, a % b) }
    }
}
