impl Solution {
    pub fn count_triplets(arr: Vec<i32>) -> i32 {
        let mut total_count: i32 = 0;
        let mut prefix_xor: i32 = 0;
        let mut prefix_count: std::collections::HashMap<i32, i32> = std::collections::HashMap::new();
        let mut index_sum: std::collections::HashMap<i32, i32> = std::collections::HashMap::new();
        prefix_count.insert(0, 1);
        index_sum.insert(0, 0);
        for (i, &value) in arr.iter().enumerate() {
            let k = (i + 1) as i32;
            prefix_xor ^= value;
            if prefix_count.contains_key(&prefix_xor) {
                total_count += prefix_count[&prefix_xor] * (k - 1) - index_sum[&prefix_xor];
            } else {
                prefix_count.insert(prefix_xor, 0);
                index_sum.insert(prefix_xor, 0);
            }
            *prefix_count.get_mut(&prefix_xor).unwrap() += 1;
            *index_sum.get_mut(&prefix_xor).unwrap() += k;
        }
        total_count
    }
}
