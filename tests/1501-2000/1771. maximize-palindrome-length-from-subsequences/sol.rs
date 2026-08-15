impl Solution {
    pub fn longest_palindrome(word1: String, word2: String) -> i32 {
        let word = word1.clone() + &word2;
        let chars: Vec<char> = word.chars().collect();
        let n = chars.len();
        let mut memo = vec![vec![-1; n]; n];
        
        fn fn_helper(lo: usize, hi: usize, chars: &[char], memo: &mut Vec<Vec<i32>>) -> i32 {
            if lo >= hi {
                return if lo == hi { 1 } else { 0 };
            }
            if memo[lo][hi] != -1 {
                return memo[lo][hi];
            }
            if chars[lo] == chars[hi] {
                memo[lo][hi] = 2 + fn_helper(lo+1, hi-1, chars, memo);
            } else {
                memo[lo][hi] = std::cmp::max(fn_helper(lo+1, hi, chars, memo), fn_helper(lo, hi-1, chars, memo));
            }
            memo[lo][hi]
        }
        
        let mut ans = 0;
        let mut seen = std::collections::HashSet::new();
        for c in word1.chars() {
            if seen.contains(&c) { continue; }
            seen.insert(c);
            let idx1 = word1.chars().position(|x| x == c).unwrap();
            let Some(rev) = word2.chars().rev().position(|x| x == c) else { continue; };
            let idx2 = word2.chars().count() - 1 - rev;
            ans = ans.max(fn_helper(idx1, idx2 + word1.chars().count(), &chars, &mut memo));
        }
        ans
    }
}
