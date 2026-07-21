impl Solution {
    pub fn num_sub(s: String) -> i32 {
        let mut cnt: i32 = 0;
        let mut total: i32 = 0;
        let modulo: i32 = 1000000007;
        for a in s.chars() {
            if a == '1' {
                cnt += 1;
            } else {
                cnt = 0;
            }
            total = (total + cnt) % modulo;
        }
        total
    }
}
