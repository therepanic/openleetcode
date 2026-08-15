impl Solution {
    pub fn min_moves(nums: Vec<i32>, limit: i32) -> i32 {
        let n = nums.len();
        let mut diff = vec![0; (2 * limit + 2) as usize];
        
        for i in 0..n / 2 {
            let a = nums[i];
            let b = nums[n - 1 - i];
            let low = a.min(b) + 1;
            let high = a.max(b) + limit;
            let total = a + b;
            
            diff[2] += 2;
            diff[(2 * limit + 1) as usize] -= 2;
            
            diff[low as usize] -= 1;
            diff[(high + 1) as usize] += 1;
            
            diff[total as usize] -= 1;
            diff[(total + 1) as usize] += 1;
        }
        
        let mut ans = i32::MAX;
        let mut moves = 0;
        for target in 2..=(2 * limit) {
            moves += diff[target as usize];
            ans = ans.min(moves);
        }
        
        ans
    }
}
