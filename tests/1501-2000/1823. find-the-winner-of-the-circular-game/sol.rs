impl Solution {
    pub fn find_the_winner(n: i32, k: i32) -> i32 {
        let mut res = 0;
        for i in 2..=n {
            res = (res + k) % i;
        }
        res + 1
    }
}
