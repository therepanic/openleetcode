impl Solution {
    pub fn accounts_merge(accounts: Vec<Vec<String>>) -> Vec<Vec<String>> {
        use std::collections::HashMap;

        fn find(parent: &mut HashMap<String, String>, x: &str) -> String {
            let p = parent.get(x).unwrap().clone();
            if p != x {
                let root = find(parent, &p);
                parent.insert(x.to_string(), root.clone());
            }
            parent.get(x).unwrap().clone()
        }

        fn union(parent: &mut HashMap<String, String>, a: &str, b: &str) {
            let ra = find(parent, a);
            let rb = find(parent, b);
            if ra != rb {
                parent.insert(rb, ra);
            }
        }

        let mut parent: HashMap<String, String> = HashMap::new();
        let mut owner: HashMap<String, String> = HashMap::new();

        for account in &accounts {
            let name = account[0].clone();
            let first = account[1].clone();
            parent.entry(first.clone()).or_insert(first.clone());
            owner.insert(first.clone(), name.clone());
            for email in account.iter().skip(1) {
                parent.entry(email.clone()).or_insert(email.clone());
                owner.insert(email.clone(), name.clone());
                union(&mut parent, &first, email);
            }
        }

        let mut groups: HashMap<String, Vec<String>> = HashMap::new();
        let emails: Vec<String> = owner.keys().cloned().collect();
        for email in emails {
            let root = find(&mut parent, &email);
            groups.entry(root).or_default().push(email);
        }

        let mut result = Vec::new();
        for (root, mut emails) in groups {
            emails.sort();
            let mut merged = vec![owner.get(&root).unwrap().clone()];
            merged.extend(emails);
            result.push(merged);
        }
        result
    }
}
