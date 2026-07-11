impl Solution {
    pub fn num_moves_stones(a: i32, b: i32, c: i32) -> Vec<i32> {
        let mut stones = vec![a, b, c];
        stones.sort();
        let x = stones[0];
        let y = stones[1];
        let z = stones[2];
        let min_move = if z - x == 2 {
            0
        } else if y - x <= 2 || z - y <= 2 {
            1
        } else {
            2
        };
        let max_move = z - x - 2;
        vec![min_move, max_move]
    }
}
