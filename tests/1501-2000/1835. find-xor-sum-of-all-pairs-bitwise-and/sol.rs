impl Solution {
    pub fn get_xor_sum(arr1: Vec<i32>, arr2: Vec<i32>) -> i32 {
        let mut x = 0;
        let mut y = 0;
        for v in arr1 {
            x ^= v;
        }
        for v in arr2 {
            y ^= v;
        }
        x & y
    }
}
