impl Solution {
    pub fn max_product(s: String) -> i64 {
        let n = s.len();
        let s = s.as_bytes();
        
        // Manacher (odd length only)
        let mut d = vec![0; n];
        let mut l: usize = 0;
        let mut r: i32 = -1;
        
        for i in 0..n {
            let mut k: usize;
            if i as i32 > r {
                k = 1;
            } else {
                let mirror = (l as i32 + r - i as i32) as usize;
                k = (d[mirror]).min((r - i as i32 + 1) as usize);
            }
            
            while i >= k && i + k < n && s[i - k] == s[i + k] {
                k += 1;
            }
            
            d[i] = k;
            
            if (i + k - 1) as i32 > r {
                l = i - k + 1;
                r = (i + k - 1) as i32;
            }
        }
        
        // left[i] = max palindrome ending at i
        let mut left = vec![0; n];
        
        for i in 0..n {
            let radius = d[i];
            let length = 2 * radius - 1;
            let end = i + radius - 1;
            left[end] = left[end].max(length);
        }
        
        // propagate backwards (reduce by 2)
        for i in (0..(n - 1)).rev() {
            left[i] = left[i].max(left[i + 1].saturating_sub(2));
        }
        
        // prefix max
        for i in 1..n {
            left[i] = left[i].max(left[i - 1]);
        }
        
        
        // right[i] = max palindrome starting at i
        let mut right = vec![0; n];
        
        for i in 0..n {
            let radius = d[i];
            let length = 2 * radius - 1;
            let start = i - radius + 1;
            right[start] = right[start].max(length);
        }
        
        // propagate forward (reduce by 2)
        for i in 1..n {
            right[i] = right[i].max(right[i - 1].saturating_sub(2));
        }
        
        // suffix max
        for i in (0..(n - 1)).rev() {
            right[i] = right[i].max(right[i + 1]);
        }
        
        
        // try all splits
        let mut ans: i64 = 0;
        for i in 0..(n - 1) {
            let prod = (left[i] as i64) * (right[i + 1] as i64);
            ans = ans.max(prod);
        }
        
        ans
    }
}
