impl Solution {
    pub fn most_visited(n: i32, rounds: Vec<i32>) -> Vec<i32> {
        let s = rounds[0];
        let e = *rounds.last().unwrap();
        if s <= e {
            (s..=e).collect()
        } else {
            (1..=e).chain(s..=n).collect()
        }
    }
}
