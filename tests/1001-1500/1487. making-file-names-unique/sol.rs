impl Solution {
    pub fn get_folder_names(names: Vec<String>) -> Vec<String> {
        use std::collections::HashMap;
        
        let mut name_count: HashMap<String, i32> = HashMap::new();
        let mut result: Vec<String> = Vec::new();

        for name in names {
            if !name_count.contains_key(&name) {
                result.push(name.clone());
                name_count.insert(name, 1);
            } else {
                let mut k = *name_count.get(&name).unwrap();
                while name_count.contains_key(&format!("{}({})", name, k)) {
                    k += 1;
                }
                let new_name = format!("{}({})", name, k);
                result.push(new_name.clone());
                name_count.insert(name, k + 1);
                name_count.insert(new_name, 1);
            }
        }

        result
    }
}
