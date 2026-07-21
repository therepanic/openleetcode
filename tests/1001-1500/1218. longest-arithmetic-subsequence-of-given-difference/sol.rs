impl Solution {
    pub fn longest_subsequence(arr: Vec<i32>, difference: i32) -> i32 {
        use std::collections::HashMap;
        let mut dic: HashMap<i32, i32> = HashMap::new();
        let mut max_len = 0;
        for x in arr {
            let prev = dic.get(&(x - difference)).copied().unwrap_or(0);
            let val = prev + 1;
            dic.insert(x, val);
            if val > max_len {
                max_len = val;
            }
        }
        max_len
    }
}
