impl Solution {
    pub fn count_quadruplets(nums: Vec<i32>) -> i32 {
        let mut res = 0;
        let n = nums.len();
        for w in 0..n {
            for x in (w+1)..n {
                for y in (x+1)..n {
                    for z in (y+1)..n {
                        if nums[w] + nums[x] + nums[y] == nums[z] {
                            res += 1;
                        }
                    }
                }
            }
        }
        res
    }
}
