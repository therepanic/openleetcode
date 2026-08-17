impl Solution {
    pub fn min_days(n: i32) -> i32 {
        let mut ans = 0;
        let mut queue = vec![n];
        let mut seen = std::collections::HashSet::new();
        while !queue.is_empty() {
            let mut newq = Vec::new();
            for &x in &queue {
                if x == 0 { return ans; }
                seen.insert(x);
                if !seen.contains(&(x-1)) { newq.push(x-1); }
                if x % 2 == 0 && !seen.contains(&(x/2)) { newq.push(x/2); }
                if x % 3 == 0 && !seen.contains(&(x/3)) { newq.push(x/3); }
            }
            ans += 1;
            queue = newq;
        }
        ans
    }
}
