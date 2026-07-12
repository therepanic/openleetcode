impl Solution {
    pub fn distribute_candies(candies: i32, num_people: i32) -> Vec<i32> {
        let mut res = vec![0; num_people as usize];
        let mut give = 1;
        let mut i = 0;
        let mut remaining = candies;

        while remaining > 0 {
            res[i % num_people as usize] += std::cmp::min(give, remaining);
            remaining -= give;
            give += 1;
            i += 1;
        }

        res
    }
}
