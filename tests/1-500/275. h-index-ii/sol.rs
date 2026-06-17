impl Solution {
    pub fn h_index(citations: Vec<i32>) -> i32 {
        let n = citations.len();
        let mut l = 0;
        let mut r = n;
        while l < r {
            let m = (l + r + 1) / 2;
            if citations[n - m] >= m as i32 {
                l = m;
            } else {
                r = m - 1;
            }
        }
        l as i32
    }
}
