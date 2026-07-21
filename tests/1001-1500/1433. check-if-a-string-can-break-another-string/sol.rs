impl Solution {
    pub fn check_if_can_break(s1: String, s2: String) -> bool {
        let mut freq = vec![0; 26];
        let n = s1.len();

        for ch in s1.chars() {
            freq[(ch as u8 - 'a' as u8) as usize] += 1;
        }

        let mut temp1 = String::with_capacity(n);

        for i in (0..26).rev() {
            while freq[i] > 0 {
                temp1.push(('a' as u8 + i as u8) as char);
                freq[i] -= 1;
            }
        }

        freq = vec![0; 26];

        for ch in s2.chars() {
            freq[(ch as u8 - 'a' as u8) as usize] += 1;
        }

        let mut temp2 = String::with_capacity(n);

        for i in (0..26).rev() {
            while freq[i] > 0 {
                temp2.push(('a' as u8 + i as u8) as char);
                freq[i] -= 1;
            }
        }

        let sorted1: Vec<char> = temp1.chars().collect();
        let sorted2: Vec<char> = temp2.chars().collect();

        let mut all1 = true;
        let mut all2 = true;

        for i in 0..n {
            if sorted1[i] < sorted2[i] {
                all1 = false;
            }
            if sorted2[i] < sorted1[i] {
                all2 = false;
            }
        }

        all1 || all2
    }
}
