use std::collections::HashSet;

impl Solution {
    pub fn longest_consecutive(nums: Vec<i32>) -> i32 {
        let seen: HashSet<i32> = nums.into_iter().collect();
        let mut best = 0;
        for &num in &seen {
            if seen.contains(&(num - 1)) { continue; }
            let mut current = num;
            let mut streak = 1;
            while seen.contains(&(current + 1)) { current += 1; streak += 1; }
            best = best.max(streak);
        }
        best
    }
}
