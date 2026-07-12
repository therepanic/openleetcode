impl Solution {
    pub fn split_array_same_average(nums: Vec<i32>) -> bool {
        let n = nums.len();
        if n < 2 {
            return false;
        }
        let total: i32 = nums.iter().sum();
        let transformed: Vec<i32> = nums.iter().map(|&v| v * n as i32 - total).collect();
        
        let mid = n >> 1;
        use std::collections::{HashMap, HashSet};
        
        fn generate(arr: &[i32]) -> HashMap<usize, HashSet<i32>> {
            let mut mp: HashMap<usize, HashSet<i32>> = HashMap::new();
            let len = arr.len();
            for mask in 1..(1 << len) {
                let mut sum = 0;
                let mut cnt = 0;
                for i in 0..len {
                    if mask & (1 << i) != 0 {
                        sum += arr[i];
                        cnt += 1;
                    }
                }
                mp.entry(cnt).or_insert_with(HashSet::new).insert(sum);
            }
            mp
        }
        
        let mp_a = generate(&transformed[..mid]);
        let mp_b = generate(&transformed[mid..]);
        
        for (cnt, set) in &mp_a {
            if set.contains(&0) && *cnt != 0 {
                return true;
            }
        }
        for (cnt, set) in &mp_b {
            if set.contains(&0) && *cnt != 0 {
                return true;
            }
        }
        
        for (cnt_a, set_a) in &mp_a {
            for (cnt_b, set_b) in &mp_b {
                let total_cnt = cnt_a + cnt_b;
                if total_cnt == 0 || total_cnt == n {
                    continue;
                }
                for val in set_a {
                    if set_b.contains(&(-val)) {
                        return true;
                    }
                }
            }
        }
        false
    }
}
