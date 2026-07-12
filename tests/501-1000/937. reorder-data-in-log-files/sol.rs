impl Solution {
    pub fn reorder_log_files(logs: Vec<String>) -> Vec<String> {
        let mut logs = logs;
        logs.sort_by(|a, b| {
            let (ident_a, rest_a) = a.split_once(' ').unwrap();
            let (ident_b, rest_b) = b.split_once(' ').unwrap();
            let is_digit_a = rest_a.chars().next().unwrap().is_digit(10);
            let is_digit_b = rest_b.chars().next().unwrap().is_digit(10);
            match (is_digit_a, is_digit_b) {
                (false, false) => {
                    rest_a.cmp(rest_b).then(ident_a.cmp(ident_b))
                }
                (true, true) => std::cmp::Ordering::Equal,
                (true, false) => std::cmp::Ordering::Greater,
                (false, true) => std::cmp::Ordering::Less,
            }
        });
        logs
    }
}
