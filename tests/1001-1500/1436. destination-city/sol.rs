impl Solution {
    pub fn dest_city(paths: Vec<Vec<String>>) -> String {
        use std::collections::HashSet;
        
        let mut start_cities = HashSet::new();
        
        for path in &paths {
            start_cities.insert(&path[0]);
        }
        
        for path in &paths {
            if !start_cities.contains(&path[1]) {
                return path[1].clone();
            }
        }
        
        String::new()
    }
}
