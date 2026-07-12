impl Solution {
    pub fn is_alien_sorted(words: Vec<String>, order: String) -> bool {
        let mut order_map = [0usize; 26];
        for (i, c) in order.chars().enumerate() {
            order_map[(c as u8 - b'a') as usize] = i;
        }

        for i in 0..words.len() - 1 {
            let w1 = words[i].as_bytes();
            let w2 = words[i + 1].as_bytes();

            let min_len = w1.len().min(w2.len());
            let mut j = 0;
            while j < min_len {
                if w1[j] != w2[j] {
                    if order_map[(w1[j] - b'a') as usize] > order_map[(w2[j] - b'a') as usize] {
                        return false;
                    }
                    break;
                }
                j += 1;
            }
            if j == min_len && w1.len() > w2.len() {
                return false;
            }
        }

        true
    }
}
