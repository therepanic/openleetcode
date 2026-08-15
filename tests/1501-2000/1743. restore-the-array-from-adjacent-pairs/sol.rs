impl Solution {
    pub fn restore_array(adjacent_pairs: Vec<Vec<i32>>) -> Vec<i32> {
        use std::collections::HashMap;
        let mut xor_map = HashMap::new();
        let mut degree = HashMap::new();

        for pair in adjacent_pairs.iter() {
            let u = pair[0];
            let v = pair[1];
            *xor_map.entry(u).or_insert(0) ^= v;
            *xor_map.entry(v).or_insert(0) ^= u;
            *degree.entry(u).or_insert(0) += 1;
            *degree.entry(v).or_insert(0) += 1;
        }

        let mut start = 0;
        for (k, v) in degree.iter() {
            if *v == 1 {
                start = *k;
                break;
            }
        }

        let n = adjacent_pairs.len() + 1;
        let mut res = vec![0; n];

        res[0] = start;
        let mut prev = 0;

        for i in 1..n {
            res[i] = xor_map[&res[i - 1]] ^ prev;
            prev = res[i - 1];
        }

        res
    }
}
