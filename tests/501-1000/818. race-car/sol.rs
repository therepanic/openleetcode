impl Solution {
    pub fn racecar(target: i32) -> i32 {
        use std::collections::VecDeque;
        let mut q = VecDeque::new();
        q.push_back((0i32, 1i32, 0i32));
        while let Some((cp, cs, nm)) = q.pop_front() {
            if cp == target {
                return nm;
            }
            q.push_back((cp + cs, cs * 2, nm + 1));
            if (cp + cs > target && cs > 0) || (cp + cs < target && cs < 0) {
                if cs < 0 {
                    q.push_back((cp, 1, nm + 1));
                } else {
                    q.push_back((cp, -1, nm + 1));
                }
            }
        }
        -1
    }
}
