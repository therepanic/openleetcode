impl Solution {
    pub fn distribute_candies(candy_type: Vec<i32>) -> i32 {
        let n = candy_type.len();
        let k = n / 2;
        let mut set = std::collections::HashSet::new();
        for candy in candy_type {
            set.insert(candy);
        }
        std::cmp::min(k as i32, set.len() as i32)
    }
}
