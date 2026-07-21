impl Solution {
    pub fn string_matching(words: Vec<String>) -> Vec<String> {
        let n = words.len();
        let mut ans = Vec::new();
        for i in 0..n {
            for j in 0..n {
                if i != j && words[j].contains(&words[i]) {
                    ans.push(words[i].clone());
                    break;
                }
            }
        }
        ans
    }
}
