impl Solution {
    pub fn array_rank_transform(arr: Vec<i32>) -> Vec<i32> {
        let mut s = arr.clone();
        s.sort();
        let mut unique = Vec::new();
        for &x in &s {
            if unique.is_empty() || *unique.last().unwrap() != x {
                unique.push(x);
            }
        }
        arr.iter().map(|&x| Solution::bisect_left(&unique, x) as i32 + 1).collect()
    }
    
    fn bisect_left(a: &Vec<i32>, x: i32) -> usize {
        let mut lo = 0;
        let mut hi = a.len();
        while lo < hi {
            let mid = (lo + hi) / 2;
            if a[mid] < x {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        lo
    }
}
