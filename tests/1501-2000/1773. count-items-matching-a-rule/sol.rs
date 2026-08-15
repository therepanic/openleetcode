impl Solution {
    pub fn count_matches(items: Vec<Vec<String>>, rule_key: String, rule_value: String) -> i32 {
        let key_map = [("type",0), ("color",1), ("name",2)];
        let idx = key_map.iter().find(|(k,_)| *k == rule_key).unwrap().1;
        let mut count = 0;
        for item in items.iter() {
            if item[idx] == rule_value {
                count += 1;
            }
        }
        count
    }
}
