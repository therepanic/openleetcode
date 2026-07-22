impl Solution {
    pub fn min_reorder(n: i32, connections: Vec<Vec<i32>>) -> i32 {
        use std::collections::HashSet;
        let n = n as usize;
        let mut roads: HashSet<(i32, i32)> = HashSet::new();
        let mut graph: Vec<Vec<i32>> = vec![vec![]; n];
        for conn in &connections {
            let x = conn[0];
            let y = conn[1];
            graph[x as usize].push(y);
            graph[y as usize].push(x);
            roads.insert((x, y));
        }

        let mut seen = vec![false; n];
        seen[0] = true;

        fn dfs(node: i32, graph: &Vec<Vec<i32>>, roads: &HashSet<(i32, i32)>, seen: &mut Vec<bool>) -> i32 {
            let mut ans = 0;
            for &neighbor in &graph[node as usize] {
                if !seen[neighbor as usize] {
                    if roads.contains(&(node, neighbor)) {
                        ans += 1;
                    }
                    seen[neighbor as usize] = true;
                    ans += dfs(neighbor, graph, roads, seen);
                }
            }
            ans
        }

        dfs(0, &graph, &roads, &mut seen)
    }
}
