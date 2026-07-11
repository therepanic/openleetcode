impl Solution {
    pub fn num_moves_stones_ii(stones: Vec<i32>) -> Vec<i32> {
        let mut stones = stones;
        stones.sort();
        let n = stones.len();
        
        let max_moves = std::cmp::max(
            stones[n - 1] - stones[1] - (n as i32 - 2),
            stones[n - 2] - stones[0] - (n as i32 - 2)
        );
        
        let mut min_moves = n as i32;
        let mut left = 0;
        for right in 0..n {
            while stones[right] - stones[left] + 1 > n as i32 {
                left += 1;
            }
            let current_window_size = (right - left + 1) as i32;
            if current_window_size == (n as i32 - 1) && stones[right] - stones[left] + 1 == n as i32 - 1 {
                min_moves = min_moves.min(2);
            } else {
                min_moves = min_moves.min(n as i32 - current_window_size);
            }
        }
        
        vec![min_moves, max_moves]
    }
}
