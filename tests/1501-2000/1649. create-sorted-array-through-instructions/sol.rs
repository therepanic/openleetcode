impl Solution {
    pub fn create_sorted_array(instructions: Vec<i32>) -> i32 {
        let n = instructions.len();
        let nums = instructions;
        let mut ans = vec![vec![0, 0]; n];
        
        let arr: Vec<usize> = (0..n).collect();
        
        fn merge(nums: &Vec<i32>, ans: &mut Vec<Vec<i32>>, left: &Vec<usize>, right: &Vec<usize>) -> Vec<usize> {
            let mut l = left.len() as i32 - 1;
            let mut r = right.len() as i32 - 1;
            while l > -1 && r > -1 {
                if nums[left[l as usize]] <= nums[right[r as usize]] {
                    ans[right[r as usize]][1] += (left.len() as i32 - 1) - l;
                    r -= 1;
                } else {
                    l -= 1;
                }
            }
            while r > -1 {
                ans[right[r as usize]][1] += left.len() as i32;
                r -= 1;
            }
            
            l = 0;
            r = 0;
            let mut res = Vec::new();
            while (l as usize) < left.len() && (r as usize) < right.len() {
                if nums[left[l as usize]] < nums[right[r as usize]] {
                    res.push(left[l as usize]);
                    l += 1;
                } else {
                    ans[right[r as usize]][0] += l;
                    res.push(right[r as usize]);
                    r += 1;
                }
            }
            while (r as usize) < right.len() {
                ans[right[r as usize]][0] += l;
                res.push(right[r as usize]);
                r += 1;
            }
            while (l as usize) < left.len() {
                res.push(left[l as usize]);
                l += 1;
            }
            res
        }
        
        fn split(nums: &Vec<i32>, ans: &mut Vec<Vec<i32>>, l: usize, r: usize, arr: &Vec<usize>) -> Vec<usize> {
            if l == r {
                return vec![arr[r]];
            }
            let mid = (l + r) / 2;
            let left = split(nums, ans, l, mid, arr);
            let right = split(nums, ans, mid + 1, r, arr);
            merge(nums, ans, &left, &right)
        }
        
        split(&nums, &mut ans, 0, n - 1, &arr);
        
        let mut real_ans = 0i64;
        for i in 0..n {
            real_ans += ans[i][0].min(ans[i][1]) as i64;
        }
        (real_ans % 1000000007) as i32
    }
}
