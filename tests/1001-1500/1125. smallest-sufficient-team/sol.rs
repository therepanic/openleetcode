use std::collections::HashMap;

impl Solution {
    pub fn smallest_sufficient_team(req_skills: Vec<String>, people: Vec<Vec<String>>) -> Vec<i32> {
        let mut index = HashMap::new();
        for (i, skill) in req_skills.iter().enumerate() {
            index.insert(skill.as_str(), i);
        }
        let mut best: HashMap<u32, Vec<i32>> = HashMap::new();
        best.insert(0, Vec::new());
        for (person, skills) in people.iter().enumerate() {
            let mut mask = 0u32;
            for skill in skills {
                if let Some(&i) = index.get(skill.as_str()) { mask |= 1 << i; }
            }
            let snapshot: Vec<(u32, Vec<i32>)> = best.iter().map(|(&m, team)| (m, team.clone())).collect();
            for (old_mask, team) in snapshot {
                let new_mask = old_mask | mask;
                if new_mask == old_mask { continue; }
                let mut candidate = team;
                candidate.push(person as i32);
                if best.get(&new_mask).map_or(true, |old| candidate.len() < old.len()) {
                    best.insert(new_mask, candidate);
                }
            }
        }
        best.remove(&((1u32 << req_skills.len()) - 1)).unwrap()
    }
}
