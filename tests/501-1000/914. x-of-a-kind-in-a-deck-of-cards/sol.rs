impl Solution {
    pub fn has_groups_size_x(deck: Vec<i32>) -> bool {
        use std::collections::HashMap;
        
        let mut counts: HashMap<i32, i32> = HashMap::new();
        for card in deck {
            *counts.entry(card).or_insert(0) += 1;
        }
        
        fn get_gcd(a: i32, b: i32) -> i32 {
            let mut x = a;
            let mut y = b;
            while y > 0 {
                let temp = y;
                y = x % y;
                x = temp;
            }
            x
        }
        
        let frequencies: Vec<i32> = counts.values().cloned().collect();
        let mut current_gcd = frequencies[0];
        
        for &count in &frequencies[1..] {
            current_gcd = get_gcd(current_gcd, count);
            if current_gcd == 1 {
                return false;
            }
        }
        
        current_gcd >= 2
    }
}
