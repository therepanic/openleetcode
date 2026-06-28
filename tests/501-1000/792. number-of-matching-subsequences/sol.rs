impl Solution {
    pub fn num_matching_subseq(s: String, words: Vec<String>) -> i32 {
        use std::collections::HashMap;
        
        let n = s.len();
        let mut mp: HashMap<char, Vec<usize>> = HashMap::new();
        for (i, c) in s.chars().enumerate() {
            mp.entry(c).or_insert_with(Vec::new).push(i);
        }
        for i in 0..26 {
            let c = (b'a' + i) as char;
            let list = mp.entry(c).or_insert_with(Vec::new);
            list.push(n);
            list.sort();
        }
        
        fn found(word: &str, mp: &HashMap<char, Vec<usize>>, n: usize) -> bool {
            let mut curr: i32 = -1;
            for c in word.chars() {
                if curr >= n as i32 {
                    return false;
                }
                let arr = &mp[&c];
                let target = (curr + 1) as usize;
                let idx = match arr.binary_search(&target) {
                    Ok(i) => i,
                    Err(i) => i,
                };
                curr = arr[idx] as i32;
            }
            (curr as usize) < n
        }
        
        let mut cnt = 0;
        for word in &words {
            if found(word, &mp, n) {
                cnt += 1;
            }
        }
        cnt
    }
}
