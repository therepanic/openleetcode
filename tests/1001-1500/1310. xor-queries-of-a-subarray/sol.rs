impl Solution {
    pub fn xor_queries(arr: Vec<i32>, queries: Vec<Vec<i32>>) -> Vec<i32> {
        let n = arr.len();
        let mut prefix = vec![0; n + 1];
        for i in 0..n {
            prefix[i + 1] = prefix[i] ^ arr[i];
        }
        queries
            .iter()
            .map(|q| {
                let a = q[0] as usize;
                let b = q[1] as usize;
                prefix[b + 1] ^ prefix[a]
            })
            .collect()
    }
}
