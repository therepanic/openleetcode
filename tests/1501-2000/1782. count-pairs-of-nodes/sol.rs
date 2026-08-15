use std::collections::{HashMap, HashSet};

impl Solution {
    pub fn count_pairs(n: i32, edges: Vec<Vec<i32>>, queries: Vec<i32>) -> Vec<i32> {
        let n = n as usize;
        let mut edge = vec![0i32; n];
        let mut edge_pair: HashMap<(usize, usize), i32> = HashMap::new();

        for e in &edges {
            let i = (e[0] - 1) as usize;
            let j = (e[1] - 1) as usize;
            edge[i] += 1;
            edge[j] += 1;
            *edge_pair.entry((i, j)).or_insert(0) += 1;
            *edge_pair.entry((j, i)).or_insert(0) += 1;
        }
        
        let mut res = edge.clone();
        res.sort();
        
        fn binse(threshold: i32, res: &Vec<i32>, n: usize) -> i32 {
            let mut i = 0;
            let mut j = n as i32 - 1;
            let mut ans = n as i32;
            while i <= j {
                let mid = (i + j) / 2;
                if res[mid as usize] > threshold {
                    ans = mid;
                    j = mid - 1;
                } else {
                    i = mid + 1;
                }
            }
            (n as i32) - ans
        }
        
        queries.iter().map(|&query| {
            let mut left = 0usize;
            let mut right = n.saturating_sub(1);
            let mut ans = 0i32;
            while left < right {
                if res[left] + res[right] > query {
                    ans += (right - left) as i32;
                    right -= 1;
                } else { left += 1; }
            }
            for (&(a, b), &count) in &edge_pair {
                if a < b && edge[a] + edge[b] > query && edge[a] + edge[b] - count <= query { ans -= 1; }
            }
            ans
        }).collect()
    }
}
