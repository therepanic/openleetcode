use std::collections::{HashMap, HashSet};

impl Solution {
    pub fn can_mouse_win(grid: Vec<String>, cat_jump: i32, mouse_jump: i32) -> bool {
        let m = grid.len();
        let n = grid[0].len();
        let mut walls = HashSet::new();
        let mut food: usize = 0;
        let mut cat: usize = 0;
        let mut mouse: usize = 0;
        
        for i in 0..m {
            let chars: Vec<char> = grid[i].chars().collect();
            for j in 0..n {
                let idx = i * n + j;
                match chars[j] {
                    'F' => food = idx,
                    'C' => cat = idx,
                    'M' => mouse = idx,
                    '#' => { walls.insert(idx); }
                    _ => {}
                }
            }
        }
        
        let dirs: [[i32; 2]; 4] = [[-1,0],[0,1],[1,0],[0,-1]];
        let max_turns = m * n * 2;
        let mut memo = HashMap::new();
        
        fn dfs(
            c: usize, mo: usize, turn: usize,
            m: usize, n: usize, food: usize, walls: &HashSet<usize>,
            cat_jump: i32, mouse_jump: i32, dirs: &[[i32;2];4], max_turns: usize,
            memo: &mut HashMap<usize, bool>
        ) -> bool {
            let key = (c * m * n + mo) * max_turns + turn;
            if let Some(&val) = memo.get(&key) { return val; }
            
            if c == food || c == mo || turn >= max_turns {
                memo.insert(key, false);
                return false;
            }
            if mo == food {
                memo.insert(key, true);
                return true;
            }
            
            let result: bool;
            if turn % 2 == 0 {  // mouse
                result = {
                    let mx = mo / n;
                    let my = mo % n;
                    let mut found = false;
                    'outer: for d in dirs {
                        for jump in 0..=mouse_jump {
                            let nx = mx as i32 + jump * d[0];
                            let ny = my as i32 + jump * d[1];
                            if nx < 0 || nx >= m as i32 || ny < 0 || ny >= n as i32 || 
                               walls.contains(&((nx as usize) * n + ny as usize)) { break; }
                            if dfs(c, (nx as usize)*n + ny as usize, turn+1, m, n, food, walls, cat_jump, mouse_jump, dirs, max_turns, memo) {
                                found = true;
                                break 'outer;
                            }
                        }
                    }
                    found
                }
            } else {  // cat
                result = {
                    let cx = c / n;
                    let cy = c % n;
                    let mut ok = true;
                    'outer: for d in dirs {
                        for jump in 0..=cat_jump {
                            let nx = cx as i32 + jump * d[0];
                            let ny = cy as i32 + jump * d[1];
                            if nx < 0 || nx >= m as i32 || ny < 0 || ny >= n as i32 || 
                               walls.contains(&((nx as usize) * n + ny as usize)) { break; }
                            if !dfs((nx as usize)*n + ny as usize, mo, turn+1, m, n, food, walls, cat_jump, mouse_jump, dirs, max_turns, memo) {
                                ok = false;
                                break 'outer;
                            }
                        }
                    }
                    ok
                }
            }
            
            memo.insert(key, result);
            result
        }
        
        dfs(cat, mouse, 0, m, n, food, &walls, cat_jump, mouse_jump, &dirs, max_turns, &mut memo)
    }
}
