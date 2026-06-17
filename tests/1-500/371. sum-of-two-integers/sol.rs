impl Solution {
    pub fn get_sum(a: i32, b: i32) -> i32 {
        let mut a = a;
        let mut b = b;
        while b != 0 {
            let c = (a & b) << 1;
            a ^= b;
            b = c;
        }
        a
    }
}
