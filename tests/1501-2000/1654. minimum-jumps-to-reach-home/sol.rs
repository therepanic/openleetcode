impl Solution {
    pub fn minimum_jumps(forbidden: Vec<i32>, a: i32, b: i32, x: i32) -> i32 {
        let mut idx = 1;
        let m = a.min(b);
        if m >= 2 {
            for i in 2..=m {
                if a % i == 0 && b % i == 0 {
                    idx = i;
                }
            }
        }
        if x % idx != 0 { return -1; }
        let mut queue: std::collections::VecDeque<(i32, i32, i32)> = std::collections::VecDeque::new();
        queue.push_back((0, 1, 0));
        let mut visited: std::collections::HashSet<i32> = std::collections::HashSet::new();
        visited.insert(0);
        for &f in &forbidden {
            visited.insert(f);
        }
        let top = forbidden.iter().max().copied().unwrap_or(0);
        let limit = top + x + a + b;
        while let Some((curr, prev, step)) = queue.pop_front() {
            if curr == x { return step; }
            if prev == 1 {
                let nb = curr - b;
                if nb >= 0 && !visited.contains(&nb) {
                    visited.insert(nb);
                    queue.push_back((nb, -1, step + 1));
                }
            }
            let na = curr + a;
            if na <= limit && !visited.contains(&na) {
                visited.insert(na);
                queue.push_back((na, 1, step + 1));
            }
        }
        -1
    }
}
