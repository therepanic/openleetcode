impl Solution {
    pub fn reorganize_string(s: String) -> String {
        use std::collections::{BinaryHeap, HashMap};
        
        let mut char_freq: HashMap<char, i32> = HashMap::new();
        for c in s.chars() {
            *char_freq.entry(c).or_insert(0) += 1;
        }
        
        let mut max_heap = BinaryHeap::new();
        for (ch, freq) in char_freq {
            max_heap.push((freq, ch));
        }
        
        let mut res = String::new();
        let mut prev_freq = 0;
        let mut prev_char = ' ';
        
        while let Some((freq, ch)) = max_heap.pop() {
            res.push(ch);
            
            if prev_freq > 0 {
                max_heap.push((prev_freq, prev_char));
            }
            
            prev_freq = freq - 1;
            prev_char = ch;
        }
        
        if res.len() != s.len() {
            return String::new();
        }
        
        res
    }
}
