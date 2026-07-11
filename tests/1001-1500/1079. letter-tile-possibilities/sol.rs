impl Solution {
    pub fn num_tile_possibilities(tiles: String) -> i32 {
        let mut chars: Vec<char> = tiles.chars().collect();
        chars.sort_unstable();
        let mut used = vec![false; chars.len()];
        Self::backtrack(&chars, &mut used)
    }
    
    fn backtrack(tiles: &[char], used: &mut Vec<bool>) -> i32 {
        let mut count = 0;
        for i in 0..tiles.len() {
            if used[i] || (i > 0 && tiles[i] == tiles[i - 1] && !used[i - 1]) {
                continue;
            }
            used[i] = true;
            count += 1 + Self::backtrack(tiles, used);
            used[i] = false;
        }
        count
    }
}
