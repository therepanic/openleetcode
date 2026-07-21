impl Solution {
    pub fn find_special_integer(arr: Vec<i32>) -> i32 {
        let n = arr.len();
        let q = n / 4;
        let mut m = std::collections::HashMap::new();
        for num in arr {
            let count = m.entry(num).or_insert(0);
            *count += 1;
            if *count > q {
                return num;
            }
        }
        -1
    }
}
