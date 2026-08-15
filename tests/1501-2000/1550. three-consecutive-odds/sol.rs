impl Solution {
    pub fn three_consecutive_odds(arr: Vec<i32>) -> bool {
        arr.iter().map(|&x| (x & 1).to_string()).collect::<String>().contains("111")
    }
}
