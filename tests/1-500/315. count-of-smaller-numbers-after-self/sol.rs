impl Solution {
    pub fn count_smaller(nums: Vec<i32>) -> Vec<i32> {
        let mut sorted_list: Vec<i32> = Vec::new();
        let mut ans: Vec<i32> = Vec::new();
        for &n in nums.iter().rev() {
            let idx = Self::bisect_left(&sorted_list, n);
            ans.push(idx as i32);
            sorted_list.insert(idx, n);
        }
        ans.reverse();
        ans
    }
    
    fn bisect_left(list: &Vec<i32>, target: i32) -> usize {
        let mut lo = 0;
        let mut hi = list.len();
        while lo < hi {
            let mid = lo + (hi - lo) / 2;
            if list[mid] >= target {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        lo
    }
}
