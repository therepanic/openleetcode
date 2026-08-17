impl Solution {
    pub fn recover_array(n: i32, sums: Vec<i32>) -> Vec<i32> {
        let mut sums = sums;
        sums.sort();
        let mut res = Vec::new();
        
        for _ in 0..n {
            let d = sums[1] - sums[0];
            
            let mut left = Vec::new();
            let mut right = Vec::new();
            let mut count = std::collections::HashMap::new();
            for &s in &sums {
                *count.entry(s).or_insert(0) += 1;
            }
            
            for &s in &sums {
                if count.get(&s).unwrap() > &0 {
                    left.push(s);
                    right.push(s + d);
                    *count.get_mut(&s).unwrap() -= 1;
                    *count.entry(s + d).or_insert(0) -= 1;
                }
            }
            
            if left.contains(&0) {
                res.push(d);
                sums = left;
            } else {
                res.push(-d);
                sums = right;
            }
        }
        res
    }
}
