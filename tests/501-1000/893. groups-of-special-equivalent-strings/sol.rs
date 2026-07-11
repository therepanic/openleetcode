impl Solution {
    pub fn num_special_equiv_groups(words: Vec<String>) -> i32 {
        let mut seen = std::collections::HashSet::new();
        for w in words {
            let mut even: Vec<char> = vec![];
            let mut odd: Vec<char> = vec![];
            for (i, c) in w.chars().enumerate() {
                if i % 2 == 0 {
                    even.push(c);
                } else {
                    odd.push(c);
                }
            }
            even.sort();
            odd.sort();
            let key = even.iter().collect::<String>() + "," + &odd.iter().collect::<String>();
            seen.insert(key);
        }
        seen.len() as i32
    }
}
