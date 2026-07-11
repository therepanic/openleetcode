impl Solution {
    pub fn subarray_bitwise_o_rs(arr: Vec<i32>) -> i32 {
        use std::collections::HashSet;

        let mut result_ors: HashSet<i32> = HashSet::new();
        let mut current_ors: HashSet<i32> = HashSet::new();

        for x in arr {
            let mut next_ors: HashSet<i32> = HashSet::new();
            for &y in &current_ors {
                next_ors.insert(x | y);
            }
            next_ors.insert(x);
            result_ors.extend(next_ors.iter().copied());
            current_ors = next_ors;
        }

        result_ors.len() as i32
    }
}
