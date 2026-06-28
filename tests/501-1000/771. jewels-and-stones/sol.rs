impl Solution {
    pub fn num_jewels_in_stones(jewels: String, stones: String) -> i32 {
        let mut count = 0;
        for i in jewels.chars() {
            if stones.contains(i) {
                count += stones.chars().filter(|&s| s == i).count() as i32;
            }
        }
        count
    }
}
