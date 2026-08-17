impl Solution {
    pub fn max_consecutive_answers(answer_key: String, k: i32) -> i32 {
        let chars: Vec<char> = answer_key.chars().collect();
        let mut l = 0;
        let mut r = 0;
        let mut false_cnt = 0;
        let mut true_cnt = 0;
        let mut result = 0;
        let n = chars.len();
        while r < n {
            if chars[r] == 'T' {
                true_cnt += 1;
            }
            if chars[r] == 'F' {
                false_cnt += 1;
            }
            while true_cnt > k && false_cnt > k {
                if chars[l] == 'T' {
                    true_cnt -= 1;
                }
                if chars[l] == 'F' {
                    false_cnt -= 1;
                }
                l += 1;
            }
            result = result.max((r - l + 1) as i32);
            r += 1;
        }
        result
    }
}
