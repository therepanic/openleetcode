impl Solution {
    pub fn find_duplicate(paths: Vec<String>) -> Vec<Vec<String>> {
        use std::collections::HashMap;
        let mut map: HashMap<String, Vec<String>> = HashMap::new();
        for path in paths {
            let parts: Vec<&str> = path.split(' ').collect();
            let directory = parts[0];
            for file in &parts[1..] {
                let paren_index = file.find('(').unwrap();
                let name = &file[..paren_index];
                let content = &file[paren_index + 1..file.len() - 1];
                let full_path = format!("{}/{}", directory, name);
                map.entry(content.to_string()).or_insert_with(Vec::new).push(full_path);
            }
        }
        map.into_values().filter(|group| group.len() > 1).collect()
    }
}
