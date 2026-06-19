impl Solution {
    pub fn read_binary_watch(turned_on: i32) -> Vec<String> {
        let mut result = Vec::new();
        for hour in 0i32..12i32 {
            for minute in 0i32..60i32 {
                if hour.count_ones() + minute.count_ones() == turned_on as u32 {
                    result.push(format!("{}:{:02}", hour, minute));
                }
            }
        }
        result
    }
}
