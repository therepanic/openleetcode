impl Solution {
    pub fn remove_subfolders(folder: Vec<String>) -> Vec<String> {
        let mut folder = folder;
        folder.sort();
        let mut res: Vec<String> = Vec::new();
        for f in folder {
            if res.is_empty() {
                res.push(f);
            } else {
                let prev = res.last().unwrap();
                if f.starts_with(prev) && f.len() > prev.len() && f.as_bytes()[prev.len()] == b'/' {
                    continue;
                } else {
                    res.push(f);
                }
            }
        }
        res
    }
}
