impl Solution {
    pub fn is_long_pressed_name(name: String, typed: String) -> bool {
        let name: Vec<char> = name.chars().collect();
        let typed: Vec<char> = typed.chars().collect();
        let mut i = 0;
        let mut j = 0;
        
        while j < typed.len() {
            if i < name.len() && name[i] == typed[j] {
                i += 1;
                j += 1;
            } else if j > 0 && typed[j] == typed[j - 1] {
                j += 1;
            } else {
                return false;
            }
        }
        
        return i == name.len();
    }
}
