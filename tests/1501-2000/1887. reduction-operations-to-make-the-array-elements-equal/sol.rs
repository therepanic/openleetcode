impl Solution {
    pub fn reduction_operations(nums: Vec<i32>) -> i32 {
        let mut freq = vec![0; 50001];
        for &num in &nums {
            freq[num as usize] += 1;
        }
        let mut idx = 1;
        while freq[idx] == 0 {
            idx += 1;
        }
        let mut val = 0;
        let mut total = 0;
        for i in (idx+1..=50000).rev() {
            if freq[i] > 0 {
                val += freq[i];
                total += val;
            }
        }
        total
    }
}
