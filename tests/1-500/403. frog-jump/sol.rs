impl Solution {
    pub fn can_cross(stones: Vec<i32>) -> bool {
        use std::collections::{HashMap, HashSet};
        let mut dp: HashMap<i32, HashSet<i32>> = HashMap::new();
        for &stone in &stones {
            dp.insert(stone, HashSet::new());
        }
        dp.get_mut(&0).unwrap().insert(0);

        for &stone in &stones {
            let jumps: Vec<i32> = dp[&stone].iter().cloned().collect();
            for jump in jumps {
                for jump_distance in [jump - 1, jump, jump + 1].iter() {
                    if *jump_distance > 0 && dp.contains_key(&(stone + jump_distance)) {
                        dp.get_mut(&(stone + jump_distance)).unwrap().insert(*jump_distance);
                    }
                }
            }
        }

        !dp[&stones[stones.len() - 1]].is_empty()
    }
}
