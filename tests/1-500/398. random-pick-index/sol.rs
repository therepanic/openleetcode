use rand::Rng;
use std::collections::HashMap;

struct Picker {
    map: HashMap<i32, Vec<usize>>,
}

impl Solution {
    fn new(nums: Vec<i32>) -> Picker {
        let mut map: HashMap<i32, Vec<usize>> = HashMap::new();
        for (i, v) in nums.iter().enumerate() {
            map.entry(*v).or_insert_with(Vec::new).push(i);
        }
        Picker { map }
    }
}

impl Picker {
    fn pick(&self, target: i32) -> i32 {
        let indices = &self.map[&target];
        let idx = rand::thread_rng().gen_range(0..indices.len());
        indices[idx] as i32
    }
}
