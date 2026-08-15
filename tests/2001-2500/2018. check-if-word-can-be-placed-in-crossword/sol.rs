impl Solution {
    pub fn place_word_in_crossword(board: Vec<Vec<char>>, word: String) -> bool {
        fn can_place(segment: &Vec<char>, word: &str) -> bool {
            let chars: Vec<char> = word.chars().collect();
            if segment.len() != chars.len() { return false; }
            for i in 0..segment.len() {
                if segment[i] != ' ' && segment[i] != chars[i] { return false; }
            }
            true
        }
        
        let m = board.len();
        let n = board[0].len();
        let reversed_word: String = word.chars().rev().collect();
        
        for row in &board {
            let mut seg: Vec<char> = Vec::new();
            for &c in row {
                if c == '#' {
                    if !seg.is_empty() {
                        if can_place(&seg, &word) || can_place(&seg, &reversed_word) { return true; }
                        seg.clear();
                    }
                } else {
                    seg.push(c);
                }
            }
            if !seg.is_empty() {
                if can_place(&seg, &word) || can_place(&seg, &reversed_word) { return true; }
            }
        }
        
        for j in 0..n {
            let mut seg: Vec<char> = Vec::new();
            for i in 0..m {
                let c = board[i][j];
                if c == '#' {
                    if !seg.is_empty() {
                        if can_place(&seg, &word) || can_place(&seg, &reversed_word) { return true; }
                        seg.clear();
                    }
                } else {
                    seg.push(c);
                }
            }
            if !seg.is_empty() {
                if can_place(&seg, &word) || can_place(&seg, &reversed_word) { return true; }
            }
        }
        false
    }
}
