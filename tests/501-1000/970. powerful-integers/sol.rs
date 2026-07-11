impl Solution {
    pub fn powerful_integers(x: i32, y: i32, bound: i32) -> Vec<i32> {
        use std::collections::HashSet;
        let mut result = HashSet::new();
        let mut i = 1;

        while i <= bound {
            let mut j = 1;
            while i + j <= bound {
                result.insert(i + j);
                if y == 1 {
                    break;
                }
                j *= y;
            }
            if x == 1 {
                break;
            }
            i *= x;
        }
        
        result.into_iter().collect()
    }
}
