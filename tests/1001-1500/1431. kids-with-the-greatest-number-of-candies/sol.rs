impl Solution {
    pub fn kids_with_candies(candies: Vec<i32>, extra_candies: i32) -> Vec<bool> {
        let current_max = *candies.iter().max().unwrap();
        let mut result = Vec::with_capacity(candies.len());
        for candy_count in candies {
            if candy_count + extra_candies >= current_max {
                result.push(true);
            } else {
                result.push(false);
            }
        }
        result
    }
}
