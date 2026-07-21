impl Solution {
    pub fn people_indexes(favorite_companies: Vec<Vec<String>>) -> Vec<i32> {
        use std::collections::HashSet;
        
        let sets: Vec<HashSet<String>> = favorite_companies
            .into_iter()
            .map(|companies| companies.into_iter().collect())
            .collect();
        
        let mut result = Vec::new();
        
        for i in 0..sets.len() {
            let mut is_subset = false;
            for j in 0..sets.len() {
                if i != j && sets[i].is_subset(&sets[j]) {
                    is_subset = true;
                    break;
                }
            }
            if !is_subset {
                result.push(i as i32);
            }
        }
        
        result
    }
}
