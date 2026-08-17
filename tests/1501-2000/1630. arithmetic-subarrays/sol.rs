impl Solution {
    pub fn check_arithmetic_subarrays(nums: Vec<i32>, l: Vec<i32>, r: Vec<i32>) -> Vec<bool> {
        let mut ans = Vec::with_capacity(l.len());
        for i in 0..l.len() {
            let mut sub: Vec<i32> = nums[l[i] as usize..=r[i] as usize].to_vec();
            sub.sort();
            let mut valid = true;
            if sub.len() > 2 {
                let d = sub[1] - sub[0];
                for j in 1..sub.len()-1 {
                    if sub[j+1] - sub[j] != d {
                        valid = false;
                        break;
                    }
                }
            }
            ans.push(valid);
        }
        ans
    }
}
