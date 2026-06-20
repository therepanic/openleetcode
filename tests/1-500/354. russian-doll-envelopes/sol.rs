impl Solution {
    pub fn max_envelopes(envelopes: Vec<Vec<i32>>) -> i32 {
        let mut envelopes = envelopes;
        envelopes.sort_by(|a, b| a[0].cmp(&b[0]).then(b[1].cmp(&a[1])));
        let mut result: Vec<i32> = Vec::new();
        for e in envelopes {
            let h = e[1];
            let idx = result.binary_search(&h).unwrap_or_else(|x| x);
            if idx == result.len() {
                result.push(h);
            } else {
                result[idx] = h;
            }
        }
        result.len() as i32
    }
}
