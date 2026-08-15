impl Solution {
    pub fn alert_names(key_name: Vec<String>, key_time: Vec<String>) -> Vec<String> {
        use std::collections::HashMap;
        
        let mut map: HashMap<String, Vec<i32>> = HashMap::new();
        
        for (name, time) in key_name.iter().zip(key_time.iter()) {
            let parts: Vec<&str> = time.split(':').collect();
            let minutes = parts[0].parse::<i32>().unwrap() * 60 + parts[1].parse::<i32>().unwrap();
            map.entry(name.clone()).or_insert(Vec::new()).push(minutes);
        }
        
        let mut result = Vec::new();
        
        for (name, mut times) in map {
            times.sort();
            for i in 0..times.len().saturating_sub(2) {
                if times[i+2] - times[i] <= 60 {
                    result.push(name.clone());
                    break;
                }
            }
        }
        
        result.sort();
        result
    }
}
