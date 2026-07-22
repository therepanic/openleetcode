impl Solution {
    pub fn max_abs_val_expr(arr1: Vec<i32>, arr2: Vec<i32>) -> i32 {
        let mut res = 0;
        let n = arr1.len();
        let signs = [(1, 1), (1, -1), (-1, 1), (-1, -1)];

        for (p, q) in signs.iter() {
            let mut max_val = i32::MIN;
            let mut min_val = i32::MAX;
            for i in 0..n {
                let value = p * arr1[i] + q * arr2[i] + i as i32;
                max_val = max_val.max(value);
                min_val = min_val.min(value);
            }
            res = res.max(max_val - min_val);
        }

        res
    }
}
