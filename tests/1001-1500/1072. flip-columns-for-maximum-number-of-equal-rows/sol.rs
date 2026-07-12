impl Solution {
    pub fn max_equal_rows_after_flips(matrix: Vec<Vec<i32>>) -> i32 {
        use std::collections::HashMap;
        let mut count = HashMap::new();
        let mut ans = 0;

        for row in &matrix {
            let flip = row[0];
            let key: Vec<String> = row.iter().map(|&x| (x ^ flip).to_string()).collect();
            let key = key.join(",");
            let val = count.entry(key).or_insert(0);
            *val += 1;
            if *val > ans {
                ans = *val;
            }
        }

        ans
    }
}
