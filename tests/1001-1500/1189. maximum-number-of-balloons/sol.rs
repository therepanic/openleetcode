impl Solution {
    pub fn max_number_of_balloons(text: String) -> i32 {
        let mut f = std::collections::HashMap::new();
        for c in text.chars() {
            *f.entry(c).or_insert(0) += 1;
        }
        let get = |c| *f.get(&c).unwrap_or(&0);
        *[get('b'), get('a'), get('l') / 2, get('o') / 2, get('n')].iter().min().unwrap()
    }
}
