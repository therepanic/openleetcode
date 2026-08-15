impl Solution {
    pub fn sum_of_floored_pairs(nums: Vec<i32>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let maxi = 100_001usize;
        let max_val = *nums.iter().max().unwrap() as usize;
        let size = 2 * maxi + 1;
        let mut freq = vec![0i64; size];
        for &num in &nums {
            freq[num as usize] += 1;
        }
        for i in 1..size {
            freq[i] += freq[i - 1];
        }
        
        let mut total = 0i64;
        for num in 1..=max_val {
            let count_num = freq[num] - freq[num - 1];
            if count_num == 0 {
                continue;
            }
            let mut floor_value = 1usize;
            while floor_value * num <= max_val {
                let left = floor_value * num;
                let right = ((floor_value + 1) * num - 1).min(max_val);
                let count_in_range = freq[right] - freq[left - 1];
                total = (total + count_num * floor_value as i64 * count_in_range) % MOD;
                floor_value += 1;
            }
        }
        total as i32
    }
}
