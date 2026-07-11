impl Solution {
    pub fn num_unique_emails(emails: Vec<String>) -> i32 {
        use std::collections::HashSet;
        let mut res = HashSet::new();
        for email in &emails {
            let at_index = email.find('@').unwrap();
            let mut local = email[..at_index].to_string();
            let domain = email[at_index + 1..].to_string();
            
            if let Some(plus_index) = local.find('+') {
                local = local[..plus_index].to_string();
            }
            local = local.replace('.', "");
            res.insert(local + "@" + &domain);
        }
        res.len() as i32
    }
}
