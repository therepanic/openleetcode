use std::collections::{HashMap, HashSet, VecDeque};

impl Solution {
    pub fn find_ladders(begin_word: String, end_word: String, word_list: Vec<String>) -> Vec<Vec<String>> {
        let mut words: HashSet<String> = word_list.into_iter().collect();
        if !words.contains(&end_word) {
            return Vec::new();
        }

        let word_len = begin_word.len();
        let mut dist: HashMap<String, i32> = HashMap::new();
        let mut parents: HashMap<String, Vec<String>> = HashMap::new();
        let mut queue = VecDeque::new();

        dist.insert(begin_word.clone(), 0);
        queue.push_back(begin_word.clone());

        while let Some(word) = queue.pop_front() {
            let step = dist[&word];
            let mut chars: Vec<u8> = word.as_bytes().to_vec();
            for i in 0..word_len {
                let original = chars[i];
                for c in b'a'..=b'z' {
                    if c == original {
                        continue;
                    }
                    chars[i] = c;
                    let next = String::from_utf8(chars.clone()).unwrap();
                    if !words.contains(&next) {
                        continue;
                    }
                    if !dist.contains_key(&next) {
                        dist.insert(next.clone(), step + 1);
                        parents.entry(next.clone()).or_default().push(word.clone());
                        queue.push_back(next);
                    } else if dist[&next] == step + 1 {
                        parents.entry(next.clone()).or_default().push(word.clone());
                    }
                }
                chars[i] = original;
            }
        }

        if !dist.contains_key(&end_word) {
            return Vec::new();
        }

        fn backtrack(
            current: &str,
            begin_word: &str,
            parents: &HashMap<String, Vec<String>>,
            path: &mut Vec<String>,
            answer: &mut Vec<Vec<String>>,
        ) {
            if current == begin_word {
                let mut seq = path.clone();
                seq.reverse();
                answer.push(seq);
                return;
            }
            if let Some(prevs) = parents.get(current) {
                for prev in prevs {
                    path.push(prev.clone());
                    backtrack(prev, begin_word, parents, path, answer);
                    path.pop();
                }
            }
        }

        let mut answer = Vec::new();
        let mut path = vec![end_word.clone()];
        backtrack(&end_word, &begin_word, &parents, &mut path, &mut answer);
        answer
    }
}
