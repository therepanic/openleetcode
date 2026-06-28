impl Solution {
    pub fn next_greatest_letter(letters: Vec<char>, target: char) -> char {
        let mut res = letters[0];
        let mut flag = false;

        for &ch in &letters {
            if !flag {
                if ch > target {
                    res = ch;
                    flag = !flag;
                }
            } else {
                if ch > target && ch < res {
                    res = ch;
                }
            }
        }

        res
    }
}
