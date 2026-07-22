impl Solution {
    pub fn is_path_crossing(path: String) -> bool {
        use std::collections::HashSet;
        let mut set = HashSet::new();
        let (mut x, mut y) = (0, 0);
        set.insert((0, 0));
        for c in path.chars() {
            match c {
                'N' => y += 1,
                'S' => y -= 1,
                'E' => x += 1,
                'W' => x -= 1,
                _ => (),
            }
            if !set.insert((x, y)) {
                return true;
            }
        }
        false
    }
}
