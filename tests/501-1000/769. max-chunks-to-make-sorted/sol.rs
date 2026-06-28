impl Solution {
    pub fn max_chunks_to_sorted(arr: Vec<i32>) -> i32 {
        let mut ans = 0;
        let mut prev_max = 0;
        for (idx, &x) in arr.iter().enumerate() {
            prev_max = prev_max.max(x);
            if prev_max == idx as i32 {
                ans += 1;
            }
        }
        ans
    }
}
