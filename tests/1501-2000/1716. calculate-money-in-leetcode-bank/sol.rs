impl Solution {
    pub fn total_money(n: i32) -> i32 {
        let q = n / 7;
        let r = n % 7;
        Self::arithmetic_progression(28, 28+(q-1)*7, q) + Self::arithmetic_progression(q+1, q+r, r)
    }
    fn arithmetic_progression(leading: i32, last: i32, terms: i32) -> i32 {
        (leading+last)*terms/2
    }
}
