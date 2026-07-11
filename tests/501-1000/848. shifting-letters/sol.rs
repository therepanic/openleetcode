impl Solution {
    pub fn shifting_letters(s: String, shifts: Vec<i32>) -> String {
        let n = shifts.len();
        let mut l = vec![0i32; n];
        let mut z = 0i32;
        for i in (0..n).rev() {
            z = (z + shifts[i]) % 26;
            l[i] = z;
        }
        let p: Vec<i32> = s.chars().map(|c| c as i32 - 97).collect();
        let mut k = String::new();
        for i in 0..n {
            let ch = ((p[i] + l[i]) % 26 + 97) as u8 as char;
            k.push(ch);
        }
        k
    }
}
