impl Solution {
    pub fn can_i_win(max_choosable_integer: i32, desired_total: i32) -> bool {
        if desired_total <= 0 {
            return true;
        }
        let sum = max_choosable_integer * (max_choosable_integer + 1) / 2;
        if sum < desired_total {
            return false;
        }
        
        let max = max_choosable_integer as usize;
        let mut memo = std::collections::HashMap::new();
        
        fn can_win(state: i32, total: i32, max: usize, memo: &mut std::collections::HashMap<i32, bool>) -> bool {
            if let Some(&v) = memo.get(&state) {
                return v;
            }
            for i in 1..=max {
                let bit = 1 << (i - 1);
                if (state & bit) == 0 {
                    if i as i32 >= total || !can_win(state | bit, total - i as i32, max, memo) {
                        memo.insert(state, true);
                        return true;
                    }
                }
            }
            memo.insert(state, false);
            false
        }
        
        can_win(0, desired_total, max, &mut memo)
    }
}
