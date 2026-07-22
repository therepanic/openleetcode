impl Solution {
    pub fn xor_operation(n: i32, start: i32) -> i32 {
        let mut ans = 0;
        let mut current_start = start;
        let mut remaining = n;
        while remaining > 0 {
            ans ^= current_start;
            current_start += 2;
            remaining -= 1;
        }
        ans
    }
}
