impl Solution {
    pub fn longest_diverse_string(a: i32, b: i32, c: i32) -> String {
        let mut counts = [a, b, c];
        let letters = ['a', 'b', 'c'];
        let mut result: Vec<char> = Vec::new();
        loop {
            let mut choice: Option<usize> = None;
            for index in 0..3 {
                if counts[index] == 0 || (result.len() >= 2 && result[result.len() - 1] == letters[index] && result[result.len() - 2] == letters[index]) { continue; }
                if choice.is_none() || counts[index] > counts[choice.unwrap()] { choice = Some(index); }
            }
            match choice {
                Some(index) => { result.push(letters[index]); counts[index] -= 1; }
                None => break,
            }
        }
        result.into_iter().collect()
    }
}
