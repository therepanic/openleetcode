impl Solution {
    pub fn can_construct(s: String, k: i32) -> bool {
        if s.len() < k as usize {
            return false;
        }

        let mut char_count = vec![0; 26];
        for c in s.chars() {
            char_count[c as usize - 'a' as usize] += 1;
        }

        let odd_count = char_count.iter().filter(|&&freq| freq % 2 != 0).count();
        odd_count <= k as usize
    }
}
