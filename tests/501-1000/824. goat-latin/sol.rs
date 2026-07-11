impl Solution {
    pub fn to_goat_latin(sentence: String) -> String {
        let vowels: std::collections::HashSet<char> = 
            ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'].iter().cloned().collect();
        let mut ans = Vec::new();
        for (i, word) in sentence.split_whitespace().enumerate() {
            let mut goat = String::new();
            let first_char = word.chars().next().unwrap();
            if vowels.contains(&first_char) {
                goat.push_str(word);
            } else {
                goat.push_str(&word[first_char.len_utf8()..]);
                goat.push(first_char);
            }
            goat.push_str("ma");
            goat.push_str(&"a".repeat(i + 1));
            ans.push(goat);
        }
        ans.join(" ")
    }
}
