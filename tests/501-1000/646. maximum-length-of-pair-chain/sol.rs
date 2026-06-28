impl Solution {
    pub fn find_longest_chain(pairs: Vec<Vec<i32>>) -> i32 {
        let mut pairs = pairs;
        pairs.sort_by_key(|v| v[1]);
        let mut prev = &pairs[0];
        let mut res = 1;
        for cur in pairs.iter().skip(1) {
            if cur[0] > prev[1] {
                res += 1;
                prev = cur;
            }
        }
        res
    }
}
