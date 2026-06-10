use std::collections::VecDeque;

impl Solution {
    pub fn can_finish(num_courses: i32, prerequisites: Vec<Vec<i32>>) -> bool {
        let n = num_courses as usize;
        let mut graph = vec![Vec::new(); n];
        let mut indegree = vec![0; n];
        for edge in prerequisites {
            graph[edge[1] as usize].push(edge[0] as usize);
            indegree[edge[0] as usize] += 1;
        }
        let mut queue = VecDeque::new();
        for i in 0..n {
            if indegree[i] == 0 {
                queue.push_back(i);
            }
        }
        let mut seen = 0;
        while let Some(node) = queue.pop_front() {
            seen += 1;
            for &nxt in &graph[node] {
                indegree[nxt] -= 1;
                if indegree[nxt] == 0 {
                    queue.push_back(nxt);
                }
            }
        }
        seen == n
    }
}
