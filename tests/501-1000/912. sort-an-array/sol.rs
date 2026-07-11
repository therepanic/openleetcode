impl Solution {
    fn merge(nums: &mut Vec<i32>, l: usize, mid: usize, r: usize) {
        let mut a = Vec::new();
        let mut b = Vec::new();
        for i in l..=mid {
            a.push(nums[i]);
        }
        for j in (mid + 1)..=r {
            b.push(nums[j]);
        }
        let (mut i, mut j, mut k) = (0, 0, l);
        while k <= r {
            if j == b.len() {
                nums[k] = a[i];
                i += 1;
            } else if i == a.len() {
                nums[k] = b[j];
                j += 1;
            } else if a[i] <= b[j] {
                nums[k] = a[i];
                i += 1;
            } else {
                nums[k] = b[j];
                j += 1;
            }
            k += 1;
        }
    }

    fn mergesort(nums: &mut Vec<i32>, l: usize, r: usize) {
        if l >= r {
            return;
        }
        let mid = (l + r) / 2;
        Self::mergesort(nums, l, mid);
        Self::mergesort(nums, mid + 1, r);
        Self::merge(nums, l, mid, r);
    }

    pub fn sort_array(nums: Vec<i32>) -> Vec<i32> {
        let mut nums = nums;
        let len = nums.len();
        if len > 0 {
            Self::mergesort(&mut nums, 0, len - 1);
        }
        nums
    }
}
