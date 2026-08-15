impl Solution {
    pub fn number_of_weak_characters(properties: Vec<Vec<i32>>) -> i32 {
        let mut sorted = properties;
        sorted.sort_by(|a, b| {
            if a[0] != b[0] { b[0].cmp(&a[0]) } else { a[1].cmp(&b[1]) }
        });
        
        let mut max_defense = 0;
        let mut weak_count = 0;
        
        for prop in sorted {
            if prop[1] < max_defense {
                weak_count += 1;
            } else {
                max_defense = prop[1];
            }
        }
        
        weak_count
    }
}
