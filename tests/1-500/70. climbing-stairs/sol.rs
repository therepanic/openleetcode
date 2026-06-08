impl Solution {
    pub fn climb_stairs(n: i32) -> i32 {
        if n <= 3 {
            return n;
        }
        let mut prev2 = 2;
        let mut prev1 = 3;
        for _ in 4..=n {
            let cur = prev1 + prev2;
            prev2 = prev1;
            prev1 = cur;
        }
        prev1
    }
}
