impl Solution {
    pub fn makesquare(matchsticks: Vec<i32>) -> bool {
        let total: i32 = matchsticks.iter().sum();
        if total % 4 != 0 {
            return false;
        }
        let side = total / 4;
        
        let mut matchsticks = matchsticks.clone();
        matchsticks.sort_unstable_by(|a, b| b.cmp(a));
        
        let mut sides = [0; 4];
        Self::backtrack(&matchsticks, 0, &mut sides, side)
    }
    
    fn backtrack(matchsticks: &[i32], index: usize, sides: &mut [i32; 4], side: i32) -> bool {
        if index == matchsticks.len() {
            return sides[0] == side && sides[1] == side && sides[2] == side && sides[3] == side;
        }
        for i in 0..4 {
            if sides[i] + matchsticks[index] <= side {
                sides[i] += matchsticks[index];
                if Self::backtrack(matchsticks, index + 1, sides, side) {
                    return true;
                }
                sides[i] -= matchsticks[index];
            }
        }
        false
    }
}
