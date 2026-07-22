use std::collections::HashMap;

impl Solution {
    pub fn min_number_of_semesters(n: i32, relations: Vec<Vec<i32>>, k: i32) -> i32 {
        let n = n as usize;
        let k = k as usize;
        let mut graph: Vec<Vec<usize>> = vec![Vec::new(); n];
        let mut in_degrees = vec![0i32; n];
        for rel in &relations {
            let prev = (rel[0] - 1) as usize;
            let next = (rel[1] - 1) as usize;
            in_degrees[next] += 1;
            graph[prev].push(next);
        }
        
        let mut memo: HashMap<(i32, Vec<i32>), i32> = HashMap::new();
        
        fn recurse(
            mask: i32,
            in_degrees: Vec<i32>,
            n: usize,
            k: usize,
            graph: &Vec<Vec<usize>>,
            memo: &mut HashMap<(i32, Vec<i32>), i32>,
        ) -> i32 {
            if mask == 0 {
                return 0;
            }
            if let Some(&val) = memo.get(&(mask, in_degrees.clone())) {
                return val;
            }
            
            let mut nodes: Vec<usize> = Vec::new();
            for i in 0..n {
                if (mask & (1 << i)) != 0 && in_degrees[i] == 0 {
                    nodes.push(i);
                }
            }
            
            let mut ans = i32::MAX;
            let comb_limit = std::cmp::min(k, nodes.len());
            let combos = combinations(&nodes, comb_limit);
            for k_nodes in &combos {
                let mut new_mask = mask;
                let mut new_in_deg = in_degrees.clone();
                for &node in k_nodes {
                    new_mask ^= 1 << node;
                    for &child in &graph[node] {
                        new_in_deg[child] -= 1;
                    }
                }
                ans = std::cmp::min(ans, 1 + recurse(new_mask, new_in_deg, n, k, graph, memo));
            }
            memo.insert((mask, in_degrees.clone()), ans);
            ans
        }
        
        recurse((1 << n) - 1, in_degrees, n, k, &graph, &mut memo)
    }
}

fn combinations(arr: &[usize], k: usize) -> Vec<Vec<usize>> {
    let mut result = Vec::new();
    let mut current = Vec::new();
    fn backtrack(arr: &[usize], k: usize, start: usize, current: &mut Vec<usize>, result: &mut Vec<Vec<usize>>) {
        if current.len() == k {
            result.push(current.clone());
            return;
        }
        for i in start..arr.len() {
            current.push(arr[i]);
            backtrack(arr, k, i + 1, current, result);
            current.pop();
        }
    }
    backtrack(arr, k, 0, &mut current, &mut result);
    result
}
