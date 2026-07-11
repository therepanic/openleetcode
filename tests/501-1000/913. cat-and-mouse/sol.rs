use std::collections::{HashMap, VecDeque};

impl Solution {
    pub fn cat_mouse_game(graph: Vec<Vec<i32>>) -> i32 {
        let mouse_turn: i32 = 0;
        let cat_turn: i32 = 1;
        let mouse_win: i32 = 1;
        let cat_win: i32 = 2;
        let draw: i32 = 0;
        
        let n = graph.len();
        let mut results: HashMap<(i32, i32, i32), i32> = HashMap::new();
        for i in 1..n as i32 {
            results.insert((0, i, cat_turn), mouse_win);
            results.insert((0, i, mouse_turn), mouse_win);
            results.insert((i, i, cat_turn), cat_win);
            results.insert((i, i, mouse_turn), cat_win);
        }
        
        let mut degree: HashMap<(i32, i32, i32), i32> = HashMap::new();
        for mouse in 1..n as i32 {
            for cat in 1..n as i32 {
                degree.insert((mouse, cat, mouse_turn), graph[mouse as usize].len() as i32);
                let cat_deg = graph[cat as usize].iter().filter(|&&x| x != 0).count() as i32;
                degree.insert((mouse, cat, cat_turn), cat_deg);
            }
        }
        
        let mut q: VecDeque<(i32, i32, i32)> = VecDeque::new();
        for &state in results.keys() {
            q.push_back(state);
        }
        
        while let Some((mouse, cat, turn)) = q.pop_front() {
            let cur_result = results[&(mouse, cat, turn)];
            
            let mut prev_states: Vec<(i32, i32, i32)> = Vec::new();
            if turn == mouse_turn {
                for &prev_cat in &graph[cat as usize] {
                    prev_states.push((mouse, prev_cat, cat_turn));
                }
            } else {
                for &prev_mouse in &graph[mouse as usize] {
                    prev_states.push((prev_mouse, cat, mouse_turn));
                }
            }
            
            for prev_state in prev_states {
                if results.contains_key(&prev_state) {
                    continue;
                }
                let (prev_mouse, prev_cat, prev_turn) = prev_state;
                if prev_cat == 0 {
                    continue;
                }
                
                *degree.get_mut(&prev_state).unwrap() -= 1;
                let is_mover_winner = (cur_result == mouse_win && prev_turn == mouse_turn) ||
                                      (cur_result == cat_win && prev_turn == cat_turn);
                if is_mover_winner || degree[&prev_state] == 0 {
                    results.insert(prev_state, cur_result);
                    q.push_back(prev_state);
                }
            }
        }
        
        *results.get(&(1, 2, mouse_turn)).unwrap_or(&draw)
    }
}
