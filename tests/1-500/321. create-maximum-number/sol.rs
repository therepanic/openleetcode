impl Solution {
    pub fn max_number(nums1: Vec<i32>, nums2: Vec<i32>, k: i32) -> Vec<i32> {
        let k = k as usize;
        let mut ans = vec![];
        let m = nums1.len();
        let n = nums2.len();
        let start = if 0 > (k as i32 - n as i32) { 0 } else { k - n };
        let end = std::cmp::min(m, k);
        for i in start..=end {
            let sub1 = Self::get_max_subsequence(&nums1, i);
            let sub2 = Self::get_max_subsequence(&nums2, k - i);
            let merged = Self::merge(&sub1, &sub2);
            if Self::greater(&merged, 0, &ans, 0) {
                ans = merged;
            }
        }
        ans
    }

    fn get_max_subsequence(nums: &[i32], q: usize) -> Vec<i32> {
        let mut stack = Vec::with_capacity(q);
        let mut max_drop = nums.len() - q;
        for &num in nums {
            while max_drop > 0 && !stack.is_empty() && *stack.last().unwrap() < num {
                stack.pop();
                max_drop -= 1;
            }
            if stack.len() < q {
                stack.push(num);
            } else {
                max_drop -= 1;
            }
        }
        stack
    }

    fn merge(a: &[i32], b: &[i32]) -> Vec<i32> {
        let mut output = Vec::with_capacity(a.len() + b.len());
        let (mut i, mut j) = (0, 0);
        while i < a.len() || j < b.len() {
            if Self::greater(a, i, b, j) {
                output.push(a[i]);
                i += 1;
            } else {
                output.push(b[j]);
                j += 1;
            }
        }
        output
    }

    fn greater(a: &[i32], i: usize, b: &[i32], j: usize) -> bool {
        let mut idx1 = i;
        let mut idx2 = j;
        while idx1 < a.len() && idx2 < b.len() && a[idx1] == b[idx2] {
            idx1 += 1;
            idx2 += 1;
        }
        if idx2 == b.len() {
            return true;
        }
        if idx1 < a.len() && a[idx1] > b[idx2] {
            return true;
        }
        false
    }
}
