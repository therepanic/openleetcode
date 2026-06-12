impl Solution {
    pub fn title_to_number(column_title: String) -> i32 {
        let mut ans = 0i32;
        for ch in column_title.bytes() {
            ans = ans * 26 + (ch - b'A' + 1) as i32;
        }
        ans
    }
}
