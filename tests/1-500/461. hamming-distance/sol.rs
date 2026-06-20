impl Solution {
    pub fn hamming_distance(x: i32, y: i32) -> i32 {
        let mut count = 0;
        let mut a = x;
        let mut b = y;
        if a == b {
            return count;
        }
        while a > 0 || b > 0 {
            let mut a_bit = 0;
            let mut b_bit = 0;
            if a > 0 {
                a_bit = a % 2;
                a /= 2;
            }
            if b > 0 {
                b_bit = b % 2;
                b /= 2;
            }
            if a_bit != b_bit {
                count += 1;
            }
        }
        count
    }
}
