impl Solution {
    pub fn rank_teams(votes: Vec<String>) -> String {
        use std::collections::HashMap;
        let teams: Vec<char> = votes[0].chars().collect();
        let n = teams.len();
        let mut positions: HashMap<char, Vec<i32>> = HashMap::new();
        for &team in &teams {
            positions.insert(team, vec![0; n]);
        }
        for vote in &votes {
            for (i, team) in vote.chars().enumerate() {
                positions.get_mut(&team).unwrap()[i] += 1;
            }
        }
        let mut sorted_teams = teams.clone();
        sorted_teams.sort_by(|&a, &b| {
            let counts_a = positions.get(&a).unwrap();
            let counts_b = positions.get(&b).unwrap();
            for i in 0..n {
                if counts_a[i] != counts_b[i] {
                    return counts_b[i].cmp(&counts_a[i]);
                }
            }
            a.cmp(&b)
        });
        sorted_teams.into_iter().collect()
    }
}
