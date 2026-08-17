impl Solution {
    pub fn minimum_teachings(n: i32, languages: Vec<Vec<i32>>, friendships: Vec<Vec<i32>>) -> i32 {
        use std::collections::HashSet;
        
        let mut users_to_teach = HashSet::new();
        
        for friendship in &friendships {
            let user1 = (friendship[0] - 1) as usize;
            let user2 = (friendship[1] - 1) as usize;
            let mut can_communicate = false;
            for &lang1 in &languages[user1] {
                if languages[user2].contains(&lang1) {
                    can_communicate = true;
                    break;
                }
            }
            if !can_communicate {
                users_to_teach.insert(user1);
                users_to_teach.insert(user2);
            }
        }
        
        let mut min_users = languages.len() + 1;
        for language in 1..=n as i32 {
            let mut count = 0;
            for &user in &users_to_teach {
                if !languages[user].contains(&language) {
                    count += 1;
                }
            }
            min_users = min_users.min(count);
        }
        min_users as i32
    }
}
