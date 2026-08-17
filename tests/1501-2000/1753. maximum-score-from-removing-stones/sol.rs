impl Solution {
    pub fn maximum_score(a: i32, b: i32, c: i32) -> i32 {
        let sum = a + b + c;
        std::cmp::min(sum - std::cmp::max(a, std::cmp::max(b, c)), sum / 2)
    }
}
