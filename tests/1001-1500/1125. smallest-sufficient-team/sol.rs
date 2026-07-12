impl Solution {
    pub fn smallest_sufficient_team(req_skills: Vec<String>, people: Vec<Vec<String>>) -> Vec<i32> {
        let n = req_skills.len();
        let m = people.len();
        
        let mut skill_idx = std::collections::HashMap::new();
        for (i, skill) in req_skills.iter().enumerate() {
            skill_idx.insert(skill.clone(), i);
        }
        
        let mut people_mask = vec![0i32; m];
        for (i, skills) in people.iter().enumerate() {
            let mut mask = 0;
            for skill in skills {
                mask |= 1 << skill_idx[skill];
            }
            people_mask[i] = mask;
        }
        
        for i in 0..m {
            for j in 0..m {
                if i != j && people_mask[i] != 0 && (people_mask[i] & people_mask[j]) == people_mask[i] {
                    people_mask[i] = 0;
                    break;
                }
            }
        }
        
        let mut skill_to_people = vec![vec![]; n];
        for i in 0..m {
            if people_mask[i] == 0 {
                continue;
            }
            for bit in 0..n {
                if (people_mask[i] & (1 << bit)) != 0 {
                    skill_to_people[bit].push(i);
                }
            }
        }
        
        let mut unmet_skills: std::collections::HashSet<String> = req_skills.iter().cloned().collect();
        let mut smallest_length = i32::MAX;
        let mut current_team = vec![];
        let mut best_team = vec![];
        
        fn backtrack(
            skill: usize,
            req_skills: &Vec<String>,
            people_mask: &Vec<i32>,
            skill_to_people: &Vec<Vec<usize>>,
            skill_idx: &std::collections::HashMap<String, usize>,
            unmet_skills: &mut std::collections::HashSet<String>,
            smallest_length: &mut i32,
            current_team: &mut Vec<i32>,
            best_team: &mut Vec<i32>,
        ) {
            if unmet_skills.is_empty() {
                if *smallest_length > current_team.len() as i32 {
                    *smallest_length = current_team.len() as i32;
                    *best_team = current_team.clone();
                }
                return;
            }
            
            if skill >= req_skills.len() {
                return;
            }
            
            if !unmet_skills.contains(&req_skills[skill]) {
                backtrack(skill + 1, req_skills, people_mask, skill_to_people, skill_idx, unmet_skills, smallest_length, current_team, best_team);
                return;
            }
            
            for &i in &skill_to_people[skill] {
                let mask = people_mask[i];
                let mut skills_added = vec![];
                for s in unmet_skills.iter() {
                    if (mask & (1 << skill_idx[s])) != 0 {
                        skills_added.push(s.clone());
                    }
                }
                if skills_added.is_empty() {
                    continue;
                }
                
                for s in &skills_added {
                    unmet_skills.remove(s);
                }
                current_team.push(i as i32);
                
                backtrack(skill + 1, req_skills, people_mask, skill_to_people, skill_idx, unmet_skills, smallest_length, current_team, best_team);
                
                current_team.pop();
                for s in skills_added {
                    unmet_skills.insert(s);
                }
            }
        }
        
        backtrack(0, &req_skills, &people_mask, &skill_to_people, &skill_idx, &mut unmet_skills, &mut smallest_length, &mut current_team, &mut best_team);
        best_team
    }
}
