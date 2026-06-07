impl Solution {
    pub fn count_and_say(n: i32) -> String {
        let mut current = String::from("1");
        for _ in 1..n {
            let chars: Vec<char> = current.chars().collect();
            let mut next = String::new();
            let mut i = 0;
            while i < chars.len() {
                let mut j = i;
                while j < chars.len() && chars[j] == chars[i] {
                    j += 1;
                }
                next.push_str(&(j - i).to_string());
                next.push(chars[i]);
                i = j;
            }
            current = next;
        }
        current
    }
}
