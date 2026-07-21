impl Solution {
    pub fn count_sub_trees(n: i32, edges: Vec<Vec<i32>>, labels: String) -> Vec<i32> {
        let n = n as usize;
        let mut matrix = vec![vec![]; n];
        for edge in &edges {
            let u = edge[0] as usize;
            let v = edge[1] as usize;
            matrix[u].push(v);
            matrix[v].push(u);
        }

        let mut parent = vec![-1; n];
        let mut order = vec![0];
        let mut idx = 0;
        while idx < order.len() {
            let node = order[idx];
            for &child in &matrix[node] {
                if child as i32 != parent[node] {
                    parent[child] = node as i32;
                    order.push(child);
                }
            }
            idx += 1;
        }

        let mut counts = vec![[0; 26]; n];
        let mut ans = vec![0; n];
        let labels_bytes = labels.as_bytes();
        for &node in order.iter().rev() {
            let label = (labels_bytes[node] - b'a') as usize;
            counts[node][label] += 1;
            ans[node] = counts[node][label];
            let p = parent[node];
            if p != -1 {
                let p = p as usize;
                for i in 0..26 {
                    counts[p][i] += counts[node][i];
                }
            }
        }
        ans
    }
}
