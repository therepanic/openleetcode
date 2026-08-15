impl Solution {
    pub fn min_time_to_type(word: String) -> i32 {
        let mut answer = 0;
        let mut pointer = 'a' as u8;
        
        for c in word.bytes() {
            let clockwise = (c as i32 - pointer as i32).abs();
            let counterclockwise = 26 - clockwise;
            answer += clockwise.min(counterclockwise) + 1;
            pointer = c;
        }
        
        answer
    }
}
