impl Solution {
    pub fn find_num_of_valid_words(words: Vec<String>, puzzles: Vec<String>) -> Vec<i32> {
        use std::collections::HashMap;
        
        fn get_mask(s: &str) -> i32 {
            let mut mask = 0i32;
            for &b in s.as_bytes() {
                mask |= 1 << (b - b'a') as i32;
            }
            mask
        }
        
        let mut word_count: HashMap<i32, i32> = HashMap::new();
        for w in &words {
            let mask = get_mask(w);
            *word_count.entry(mask).or_insert(0) += 1;
        }
        
        let mut result = Vec::new();
        for p in &puzzles {
            let first_mask = 1 << (p.as_bytes()[0] - b'a') as i32;
            let puzzle_mask = get_mask(p);
            let mut sub = puzzle_mask;
            let mut count = 0;
            loop {
                if (sub & first_mask) != 0 {
                    count += word_count.get(&sub).unwrap_or(&0);
                }
                if sub == 0 { break; }
                sub = (sub - 1) & puzzle_mask;
            }
            result.push(count);
        }
        result
    }
}
