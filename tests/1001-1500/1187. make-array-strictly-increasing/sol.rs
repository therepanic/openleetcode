impl Solution {
    pub fn make_array_increasing(arr1: Vec<i32>, arr2: Vec<i32>) -> i32 {
        use std::collections::HashMap;
        
        let mut arr2 = arr2;
        arr2.sort();
        arr2.dedup();
        let mut memo: HashMap<(usize, i64), i32> = HashMap::new();
        
        fn bisect_right(arr: &[i32], target: i64) -> usize {
            let mut lo = 0;
            let mut hi = arr.len();
            while lo < hi {
                let mid = lo + (hi - lo) / 2;
                if (arr[mid] as i64) <= target {
                    lo = mid + 1;
                } else {
                    hi = mid;
                }
            }
            lo
        }
        
        fn dfs(
            i: usize, 
            prev_max: i64, 
            arr1: &[i32], 
            arr2: &[i32], 
            memo: &mut HashMap<(usize, i64), i32>
        ) -> i32 {
            if i == arr1.len() {
                return 0;
            }
            
            if let Some(&ans) = memo.get(&(i, prev_max)) {
                return ans;
            }
            
            let j = bisect_right(arr2, prev_max);
            
            let mut ans = i32::MAX / 2;
            if (arr1[i] as i64) > prev_max {
                ans = ans.min(dfs(i + 1, arr1[i] as i64, arr1, arr2, memo));
            }
            if j < arr2.len() {
                ans = ans.min(dfs(i + 1, arr2[j] as i64, arr1, arr2, memo) + 1);
            }
            
            memo.insert((i, prev_max), ans);
            ans
        }
        
        let ops = dfs(0, i64::MIN, &arr1, &arr2, &mut memo);
        if ops >= i32::MAX / 2 { -1 } else { ops }
    }
}
