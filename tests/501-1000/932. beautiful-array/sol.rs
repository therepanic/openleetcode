impl Solution {
    pub fn beautiful_array(n: i32) -> Vec<i32> {
        if n == 1 {
            return vec![1];
        }
        
        let left = Solution::beautiful_array((n + 1) / 2);
        let right = Solution::beautiful_array(n / 2);
        
        let mut result = Vec::with_capacity(n as usize);
        
        for x in left {
            result.push(2 * x - 1);
        }
        for x in right {
            result.push(2 * x);
        }
        
        result
    }
}
