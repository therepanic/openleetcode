impl Solution {
    pub fn special_array(nums: Vec<i32>) -> i32 {
        let mut ans = vec![0; nums.len() + 1];
        for i in 0..=nums.len() {
            let mut count = 0;
            for &ele in &nums {
                if (i as i32) <= ele {
                    count += 1;
                }
            }
            ans[i] = count;
            if ans[i] == i as i32 {
                return i as i32;
            }
        }
        -1
    }
}
