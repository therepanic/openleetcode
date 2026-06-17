use std::collections::{HashSet, VecDeque};

impl Solution {
    pub fn can_measure_water(x: i32, y: i32, target: i32) -> bool {
        if target > x + y {
            return false;
        }
        let mut stack = VecDeque::new();
        let mut visited = HashSet::new();
        stack.push_back((0, 0));
        while let Some((a, b)) = stack.pop_back() {
            if a + b == target {
                return true;
            }
            if !visited.insert((a, b)) {
                continue;
            }
            stack.push_back((x, b));
            stack.push_back((a, y));
            stack.push_back((0, b));
            stack.push_back((a, 0));
            let w = a.min(y - b);
            stack.push_back((a - w, b + w));
            let w = b.min(x - a);
            stack.push_back((a + w, b - w));
        }
        false
    }
}
