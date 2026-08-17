impl Solution {
    pub fn are_sentences_similar(sentence1: String, sentence2: String) -> bool {
        let s1: Vec<&str> = sentence1.split(" ").collect();
        let s2: Vec<&str> = sentence2.split(" ").collect();
        
        if s1.is_empty() || s2.is_empty() { return s1 == s2; }
        let (mut l1, mut l2, mut r1, mut r2) = (0usize, 0usize, s1.len(), s2.len());
        
        while l1 < r1 && l2 < r2 {
            if s1[l1] == s2[l2] {
                l1 += 1;
                l2 += 1;
            } else if s1[r1 - 1] == s2[r2 - 1] {
                r1 -= 1;
                r2 -= 1;
            } else {
                return false;
            }
        }
        
        true
    }
}
