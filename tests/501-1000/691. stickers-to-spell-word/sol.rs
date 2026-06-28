impl Solution {
    pub fn min_stickers(stickers: Vec<String>, target: String) -> i32 {
        use std::collections::HashMap;
        
        fn dfs(
            stickers: &Vec<String>,
            target: String,
            idx: usize,
            memo: &mut HashMap<(usize, String), i32>,
        ) -> i32 {
            if target.is_empty() {
                return 0;
            }
            if idx == stickers.len() {
                return i32::MAX;
            }
            
            let key = (idx, target.clone());
            if let Some(&result) = memo.get(&key) {
                return result;
            }
            
            let mut result = dfs(stickers, target.clone(), idx + 1, memo);
            
            let current_sticker = &stickers[idx];
            let mut new_target: Vec<char> = target.chars().collect();
            let mut something_removed = false;
            for c in current_sticker.chars() {
                if let Some(idx_to_remove) = new_target.iter().position(|&x| x == c) {
                    new_target.remove(idx_to_remove);
                    something_removed = true;
                }
            }
            
            if something_removed {
                let new_target_str: String = new_target.iter().collect();
                let sub_result = dfs(stickers, new_target_str, idx, memo);
                if sub_result != i32::MAX {
                    result = result.min(1 + sub_result);
                }
            }
            
            memo.insert(key, result);
            result
        }
        
        let mut memo = HashMap::new();
        let result = dfs(&stickers, target, 0, &mut memo);
        if result == i32::MAX {
            -1
        } else {
            result
        }
    }
}
