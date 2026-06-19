use std::collections::{VecDeque, HashSet};

impl Solution {
    fn remove_same(s: &str, i: i32) -> String {
        if i < 0 {
            return s.to_string();
        }
        let bytes = s.as_bytes();
        let mut left = i as usize;
        let mut right = i as usize;
        while left > 0 && bytes[left - 1] == bytes[i as usize] {
            left -= 1;
        }
        while right + 1 < bytes.len() && bytes[right + 1] == bytes[i as usize] {
            right += 1;
        }
        if right - left + 1 >= 3 {
            let new_s = format!("{}{}", &s[..left], &s[right + 1..]);
            return Self::remove_same(&new_s, left as i32 - 1);
        }
        s.to_string()
    }

    pub fn find_min_step(board: String, hand: String) -> i32 {
        let mut hand_chars: Vec<char> = hand.chars().collect();
        hand_chars.sort();
        let hand: String = hand_chars.into_iter().collect();

        let mut q: VecDeque<(String, String, i32)> = VecDeque::new();
        let mut visited: HashSet<String> = HashSet::new();
        q.push_back((board.clone(), hand.clone(), 0));
        visited.insert(format!("{}#{}", board, hand));

        while let Some((curr_board, curr_hand, step)) = q.pop_front() {
            for i in 0..=curr_board.len() {
                for j in 0..curr_hand.len() {
                    let hand_bytes = curr_hand.as_bytes();
                    if j > 0 && hand_bytes[j] == hand_bytes[j - 1] {
                        continue;
                    }
                    if i > 0 {
                        let board_bytes = curr_board.as_bytes();
                        if board_bytes[i - 1] == hand_bytes[j] {
                            continue;
                        }
                    }

                    let mut pick = false;
                    let board_bytes = curr_board.as_bytes();
                    if i < curr_board.len() && board_bytes[i] == hand_bytes[j] {
                        pick = true;
                    }
                    if i > 0 && i < curr_board.len()
                        && board_bytes[i - 1] == board_bytes[i]
                        && board_bytes[i] != hand_bytes[j]
                    {
                        pick = true;
                    }

                    if pick {
                        let new_board = Self::remove_same(
                            &format!(
                                "{}{}{}",
                                &curr_board[..i],
                                hand_bytes[j] as char,
                                &curr_board[i..]
                            ),
                            i as i32,
                        );
                        let new_hand = format!(
                            "{}{}",
                            &curr_hand[..j],
                            &curr_hand[j + 1..]
                        );
                        if new_board.is_empty() {
                            return step + 1;
                        }
                        let key = format!("{}#{}", new_board, new_hand);
                        if !visited.contains(&key) {
                            visited.insert(key);
                            q.push_back((new_board, new_hand, step + 1));
                        }
                    }
                }
            }
        }
        -1
    }
}
