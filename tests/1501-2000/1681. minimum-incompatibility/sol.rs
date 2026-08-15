impl Solution {
    pub fn minimum_incompatibility(nums: Vec<i32>, k: i32) -> i32 {
        let n = nums.len();
        let sz = n / k as usize;
        
        let mut counts = std::collections::HashMap::new();
        for &num in &nums {
            *counts.entry(num).or_insert(0) += 1;
        }
        if counts.values().any(|&v| v > k) {
            return -1;
        }
        
        let mut nums = nums;
        nums.sort();
        
        let mut valid_subsets = std::collections::HashMap::new();
        for mask in 0i32..(1i32 << n) {
            if mask.count_ones() as usize == sz {
                let mut subset = Vec::new();
                for i in 0..n {
                    if (mask >> i) & 1 == 1 {
                        subset.push(nums[i]);
                    }
                }
                if subset.iter().collect::<std::collections::HashSet<_>>().len() == sz {
                    let max = *subset.iter().max().unwrap();
                    let min = *subset.iter().min().unwrap();
                    valid_subsets.insert(mask, max - min);
                }
            }
        }
        
        let mut memo = std::collections::HashMap::new();
        fn solve(remaining_mask: i32, valid_subsets: &std::collections::HashMap<i32, i32>, memo: &mut std::collections::HashMap<i32, i32>) -> i32 {
            if remaining_mask == 0 {
                return 0;
            }
            if let Some(&val) = memo.get(&remaining_mask) {
                return val;
            }
            
            let first_element = (remaining_mask & -remaining_mask).trailing_zeros() as usize;
            let mut res = i32::MAX;
            
            for (&mask, &cost) in valid_subsets {
                if (mask & remaining_mask) == mask && ((mask >> first_element) & 1) == 1 {
                    let next = solve(remaining_mask ^ mask, valid_subsets, memo);
                    if next != i32::MAX {
                        res = res.min(cost + next);
                    }
                }
            }
            
            memo.insert(remaining_mask, res);
            res
        }
        
        let ans = solve((1 << n) - 1, &valid_subsets, &mut memo);
        if ans == i32::MAX { -1 } else { ans }
    }
}
