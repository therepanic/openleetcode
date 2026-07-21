use std::collections::{HashMap, BTreeSet};

impl Solution {
    pub fn avoid_flood(rains: Vec<i32>) -> Vec<i32> {
        let n = rains.len();
        let mut res = vec![-1; n];
        let mut full: HashMap<i32, usize> = HashMap::new();
        let mut dry: BTreeSet<usize> = BTreeSet::new();
        for i in 0..n {
            let lake = rains[i];
            if lake == 0 {
                dry.insert(i);
                res[i] = 1;
            } else if let Some(&prev) = full.get(&lake) {
                let j = dry.range((prev + 1)..).next().copied();
                match j {
                    Some(idx) => {
                        res[idx] = lake;
                        dry.remove(&idx);
                        full.insert(lake, i);
                    }
                    None => return vec![],
                }
            } else {
                full.insert(lake, i);
            }
        }
        res
    }
}
