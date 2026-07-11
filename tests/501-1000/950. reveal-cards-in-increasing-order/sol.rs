impl Solution {
    pub fn deck_revealed_increasing(deck: Vec<i32>) -> Vec<i32> {
        let mut deck = deck;
        deck.sort();
        let mut rebuild = std::collections::VecDeque::new();
        rebuild.push_back(deck[deck.len() - 1]);
        for i in (0..deck.len() - 1).rev() {
            let last = rebuild.pop_back().unwrap();
            rebuild.push_front(last);
            rebuild.push_front(deck[i]);
        }
        rebuild.into_iter().collect()
    }
}
