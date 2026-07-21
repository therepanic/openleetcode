impl Solution {
    pub fn max_score_words(words: Vec<String>, letters: Vec<char>, score: Vec<i32>) -> i32 {
        let mut freq = vec![0; 26];
        for c in letters {
            freq[(c as u8 - b'a') as usize] += 1;
        }
        
        let mut ans = 0;
        
        fn comb(i: usize, words: &Vec<String>, freq: Vec<i32>, score: &Vec<i32>, total: i32, ans: &mut i32) {
            if i == words.len() {
                *ans = (*ans).max(total);
                return;
            }
            
            let same = freq.clone();
            let rem = total;
            let mut temp_freq = freq.clone();
            let mut full = true;
            let mut new_total = total;
            
            for ch in words[i].chars() {
                let idx = (ch as u8 - b'a') as usize;
                if temp_freq[idx] == 0 {
                    full = false;
                    break;
                }
                temp_freq[idx] -= 1;
                new_total += score[idx];
            }
            
            if full {
                comb(i + 1, words, temp_freq, score, new_total, ans);
                comb(i + 1, words, same, score, rem, ans);
            } else {
                comb(i + 1, words, same, score, rem, ans);
            }
        }
        
        comb(0, &words, freq, &score, 0, &mut ans);
        ans
    }
}
