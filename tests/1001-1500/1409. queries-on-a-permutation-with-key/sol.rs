impl Solution {
    pub fn process_queries(queries: Vec<i32>, m: i32) -> Vec<i32> {
        let mut ans: Vec<i32> = Vec::new();
        let mut arr: Vec<i32> = (1..=m).collect();
        for &x in &queries {
            let idx = arr.iter().position(|&v| v == x).unwrap() as i32;
            ans.push(idx);
            arr.remove(idx as usize);
            arr.insert(0, x);
        }
        ans
    }
}
