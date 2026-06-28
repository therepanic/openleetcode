impl Solution {
    pub fn longest_word(words: Vec<String>) -> String {
        use std::collections::HashMap;

        #[derive(Default)]
        struct TrieNode {
            children: HashMap<char, TrieNode>,
            end: Option<usize>,
        }

        let mut root = TrieNode::default();
        for (i, word) in words.iter().enumerate() {
            let mut cur = &mut root;
            for ch in word.chars() {
                cur = cur.children.entry(ch).or_default();
            }
            cur.end = Some(i);
        }

        let mut stack: Vec<&TrieNode> = root.children.values().collect();
        let mut ans = String::new();
        while let Some(cur) = stack.pop() {
            if let Some(idx) = cur.end {
                let word = &words[idx];
                if word.len() > ans.len() || (word.len() == ans.len() && word < &ans) {
                    ans = word.clone();
                }
                for v in cur.children.values() {
                    stack.push(v);
                }
            }
        }
        ans
    }
}
