impl Solution {
    pub fn max_equal_freq(nums: Vec<i32>) -> i32 {
        use std::collections::HashMap;
        
        let mut counts: HashMap<i32, i32> = HashMap::new();
        let mut frequency_counts: HashMap<i32, i32> = HashMap::new();
        let mut best: i32 = 0;

        for (i, &value) in nums.iter().enumerate() {
            let index = (i + 1) as i32;
            let previous = *counts.get(&value).unwrap_or(&0);
            if previous > 0 {
                let fc = frequency_counts.get_mut(&previous).unwrap();
                *fc -= 1;
                if *fc == 0 {
                    frequency_counts.remove(&previous);
                }
            }
            counts.insert(value, previous + 1);
            let frequency = previous + 1;
            *frequency_counts.entry(frequency).or_insert(0) += 1;

            if frequency_counts.len() == 1 {
                let (&only_frequency, &value_count) = frequency_counts.iter().next().unwrap();
                if only_frequency == 1 || value_count == 1 {
                    best = index;
                }
            } else if frequency_counts.len() == 2 {
                let mut keys: Vec<i32> = frequency_counts.keys().cloned().collect();
                keys.sort_unstable();
                let low = keys[0];
                let high = keys[1];
                if (low == 1 && *frequency_counts.get(&low).unwrap() == 1)
                    || (high == low + 1 && *frequency_counts.get(&high).unwrap() == 1)
                {
                    best = index;
                }
            }
        }

        best
    }
}
