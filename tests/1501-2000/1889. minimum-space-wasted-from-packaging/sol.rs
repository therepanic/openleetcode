impl Solution {
    pub fn min_wasted_space(packages: Vec<i32>, boxes: Vec<Vec<i32>>) -> i32 {
        let mut packages = packages;
        packages.sort();
        let n = packages.len();
        let total_package_sum: i64 = packages.iter().map(|&x| x as i64).sum();
        
        let mut min_gross_area = i64::MAX;
        
        for mut supplier_boxes in boxes {
            supplier_boxes.sort();
            if *supplier_boxes.last().unwrap() < packages[n - 1] { continue; }
            
            let mut gross_area: i64 = 0;
            let mut low_idx = 0;
            
            for &b in &supplier_boxes {
                let high_idx = Self::upper_bound(&packages, b, low_idx);
                let count = high_idx - low_idx;
                if count > 0 {
                    gross_area += (b as i64) * (count as i64);
                    low_idx = high_idx;
                }
                if low_idx == n { break; }
            }
            
            if gross_area < min_gross_area {
                min_gross_area = gross_area;
            }
        }
        
        if min_gross_area == i64::MAX { return -1; }
        ((min_gross_area - total_package_sum) % 1_000_000_007) as i32
    }
    
    fn upper_bound(arr: &[i32], target: i32, lo: usize) -> usize {
        let mut l = lo;
        let mut h = arr.len();
        while l < h {
            let mid = l + (h - l) / 2;
            if arr[mid] <= target { l = mid + 1; }
            else { h = mid; }
        }
        l
    }
}
