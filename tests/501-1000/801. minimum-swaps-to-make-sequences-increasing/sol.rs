impl Solution {
    pub fn min_swap(nums1: Vec<i32>, nums2: Vec<i32>) -> i32 {
        let n = nums1.len();
        let mut keep = 0;
        let mut swap = 1;
        
        for i in 1..n {
            let inc = nums1[i] > nums1[i - 1] && nums2[i] > nums2[i - 1];
            let cross = nums1[i] > nums2[i - 1] && nums2[i] > nums1[i - 1];
            
            if inc && cross {
                let m = keep.min(swap);
                keep = m;
                swap = m + 1;
            } else if inc {
                swap += 1;
            } else {
                let temp = keep;
                keep = swap;
                swap = temp + 1;
            }
        }
        
        keep.min(swap)
    }
}
