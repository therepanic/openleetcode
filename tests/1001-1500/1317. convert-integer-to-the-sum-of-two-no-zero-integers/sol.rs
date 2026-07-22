impl Solution {
    pub fn get_no_zero_integers(n: i32) -> Vec<i32> {
        for i in 1..n {
            if !i.to_string().contains('0') && !(n - i).to_string().contains('0') {
                return vec![i, n - i];
            }
        }
        vec![]
    }
}
