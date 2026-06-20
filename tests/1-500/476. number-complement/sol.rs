impl Solution {
    pub fn find_complement(num: i32) -> i32 {
        let mut bit = 1;
        let mut curr = num;
        let mut result = num;
        while curr > 0 {
            result ^= bit;
            bit <<= 1;
            curr >>= 1;
        }
        result
    }
}
