impl Solution {
    pub fn monotone_increasing_digits(n: i32) -> i32 {
        let mut s: Vec<char> = n.to_string().chars().collect();
        let mut mark = s.len();
        for i in (1..s.len()).rev() {
            if s[i] < s[i - 1] {
                s[i - 1] = ((s[i - 1] as u8 - 1) as char);
                mark = i;
            }
        }
        for i in mark..s.len() {
            s[i] = '9';
        }
        s.into_iter().collect::<String>().parse().unwrap()
    }
}
