impl Solution {
    pub fn convert(s: String, num_rows: i32) -> String {
        let chars: Vec<char> = s.chars().collect();
        if num_rows == 1 || num_rows as usize >= chars.len() {
            return s;
        }

        let num_rows = num_rows as usize;
        let mut rows = vec![String::new(); num_rows];
        let mut idx: i32 = 0;
        let mut step: i32 = 1;

        for ch in chars {
            rows[idx as usize].push(ch);
            if idx == 0 {
                step = 1;
            } else if idx as usize == num_rows - 1 {
                step = -1;
            }
            idx += step;
        }

        rows.concat()
    }
}
