impl Solution {
    pub fn split_painting(segments: Vec<Vec<i32>>) -> Vec<Vec<i64>> {
        let mut events: Vec<(i32, i32)> = Vec::new();
        for seg in segments {
            events.push((seg[0], seg[2]));
            events.push((seg[1], -seg[2]));
        }
        events.sort();
        
        let mut ans: Vec<Vec<i64>> = Vec::new();
        let mut prev = -1;
        let mut mix: i64 = 0;
        for (pos, val) in events {
            if prev != -1 {
                if pos != prev && mix != 0 {
                    ans.push(vec![prev as i64, pos as i64, mix]);
                }
            }
            prev = pos;
            mix += val as i64;
        }
        ans
    }
}
