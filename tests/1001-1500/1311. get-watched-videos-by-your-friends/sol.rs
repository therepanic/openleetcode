impl Solution {
    pub fn watched_videos_by_friends(watched_videos: Vec<Vec<String>>, friends: Vec<Vec<i32>>, id: i32, level: i32) -> Vec<String> {
        use std::collections::{VecDeque, HashMap};
        
        let n = friends.len();
        let mut visited = vec![false; n];
        let mut q = VecDeque::new();
        q.push_back((id as usize, 0));
        visited[id as usize] = true;
        
        let mut target_people = Vec::new();
        
        while let Some((person, dist)) = q.pop_front() {
            if dist == level {
                target_people.push(person);
                continue;
            }
            
            for &f in &friends[person] {
                let f = f as usize;
                if !visited[f] {
                    visited[f] = true;
                    q.push_back((f, dist + 1));
                }
            }
        }
        
        let mut freq: HashMap<&String, i32> = HashMap::new();
        for p in &target_people {
            for vid in &watched_videos[*p] {
                *freq.entry(vid).or_insert(0) += 1;
            }
        }
        
        let mut result: Vec<&String> = freq.keys().cloned().collect();
        result.sort_by(|a, b| {
            let cmp = freq[a].cmp(&freq[b]);
            if cmp != std::cmp::Ordering::Equal {
                cmp
            } else {
                a.cmp(b)
            }
        });
        
        result.into_iter().cloned().collect()
    }
}
