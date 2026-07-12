impl Solution {
    pub fn is_escape_possible(blocked: Vec<Vec<i32>>, source: Vec<i32>, target: Vec<i32>) -> bool {
        use std::collections::{HashSet, VecDeque};

        let blocked_set: HashSet<(i32, i32)> = blocked.iter().map(|b| (b[0], b[1])).collect();
        let max = blocked.len() * blocked.len() / 2;
        let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)];

        fn bfs(
            start: (i32, i32),
            end: (i32, i32),
            blocked_set: &HashSet<(i32, i32)>,
            max: usize,
            dirs: &[(i32, i32)],
        ) -> bool {
            let mut visited = HashSet::new();
            let mut queue = VecDeque::new();
            queue.push_back(start);
            visited.insert(start);
            let mut count = 0;

            while let Some((x, y)) = queue.pop_front() {
                if (x, y) == end {
                    return true;
                }
                if count > max {
                    return true;
                }

                for &(dx, dy) in dirs {
                    let nx = x + dx;
                    let ny = y + dy;
                    if nx >= 0 && nx < 1_000_000 && ny >= 0 && ny < 1_000_000 {
                        let key = (nx, ny);
                        if !visited.contains(&key) && !blocked_set.contains(&key) {
                            visited.insert(key);
                            queue.push_back(key);
                        }
                    }
                }
                count += 1;
            }
            false
        }

        let start = (source[0], source[1]);
        let end = (target[0], target[1]);

        bfs(start, end, &blocked_set, max, &dirs) && bfs(end, start, &blocked_set, max, &dirs)
    }
}
