impl Solution {
    pub fn odd_even_jumps(arr: Vec<i32>) -> i32 {
        let n = arr.len();
        let mut next_higher: Vec<Option<usize>> = vec![None; n];
        let mut next_lower: Vec<Option<usize>> = vec![None; n];
        
        let mut indices: Vec<usize> = (0..n).collect();
        indices.sort_by_key(|&i| arr[i]);
        let mut stack: Vec<usize> = Vec::new();
        for &i in &indices {
            while let Some(&top) = stack.last() {
                if i > top {
                    next_higher[stack.pop().unwrap()] = Some(i);
                } else {
                    break;
                }
            }
            stack.push(i);
        }
        
        indices.sort_by_key(|&i| -arr[i]);
        stack.clear();
        for &i in &indices {
            while let Some(&top) = stack.last() {
                if i > top {
                    next_lower[stack.pop().unwrap()] = Some(i);
                } else {
                    break;
                }
            }
            stack.push(i);
        }
        
        let mut odd = vec![false; n];
        let mut even = vec![false; n];
        odd[n - 1] = true;
        even[n - 1] = true;
        
        let mut result = 1;
        for i in (0..n-1).rev() {
            if let Some(higher) = next_higher[i] {
                odd[i] = even[higher];
            }
            if let Some(lower) = next_lower[i] {
                even[i] = odd[lower];
            }
            if odd[i] {
                result += 1;
            }
        }
        result
    }
}
