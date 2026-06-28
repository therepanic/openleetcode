use std::collections::{HashSet, VecDeque};

impl Solution {
    pub fn contain_virus(is_infected: Vec<Vec<i32>>) -> i32 {
        let mut is_infected = is_infected;
        let rows = is_infected.len();
        let cols = is_infected[0].len();
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)];
        let mut total_walls = 0;

        loop {
            let mut seen = vec![vec![false; cols]; rows];
            let mut regions: Vec<Vec<(usize, usize)>> = Vec::new();
            let mut frontiers: Vec<HashSet<(usize, usize)>> = Vec::new();
            let mut walls_needed: Vec<i32> = Vec::new();

            for r in 0..rows {
                for c in 0..cols {
                    if is_infected[r][c] != 1 || seen[r][c] {
                        continue;
                    }
                    let mut stack = VecDeque::new();
                    stack.push_back((r, c));
                    seen[r][c] = true;
                    let mut region = Vec::new();
                    let mut frontier = HashSet::new();
                    let mut walls = 0;
                    while let Some((cr, cc)) = stack.pop_back() {
                        region.push((cr, cc));
                        for (dr, dc) in &directions {
                            let nr = cr as isize + dr;
                            let nc = cc as isize + dc;
                            if nr < 0 || nr >= rows as isize || nc < 0 || nc >= cols as isize {
                                continue;
                            }
                            let nr = nr as usize;
                            let nc = nc as usize;
                            if is_infected[nr][nc] == 1 && !seen[nr][nc] {
                                seen[nr][nc] = true;
                                stack.push_back((nr, nc));
                            } else if is_infected[nr][nc] == 0 {
                                walls += 1;
                                frontier.insert((nr, nc));
                            }
                        }
                    }
                    regions.push(region);
                    frontiers.push(frontier);
                    walls_needed.push(walls);
                }
            }

            if regions.is_empty() {
                break;
            }

            let mut target = 0;
            for i in 1..frontiers.len() {
                if frontiers[i].len() > frontiers[target].len() {
                    target = i;
                }
            }

            if frontiers[target].is_empty() {
                break;
            }

            total_walls += walls_needed[target];

            for &(r, c) in &regions[target] {
                is_infected[r][c] = -1;
            }

            for i in 0..regions.len() {
                if i == target {
                    continue;
                }
                let frontier_cells: Vec<(usize, usize)> = frontiers[i].iter().copied().collect();
                for (r, c) in frontier_cells {
                    is_infected[r][c] = 1;
                }
            }
        }

        total_walls
    }
}
