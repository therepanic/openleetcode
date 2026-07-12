impl Solution {
    pub fn robot_sim(commands: Vec<i32>, obstacles: Vec<Vec<i32>>) -> i32 {
        use std::collections::HashSet;

        let mut blocked = HashSet::new();
        for o in &obstacles {
            blocked.insert((o[0], o[1]));
        }

        let directions = [
            (0, 1), (1, 0), (0, -1), (-1, 0)
        ];

        let mut x = 0;
        let mut y = 0;
        let mut dir = 0;
        let mut max_dist = 0;

        for &cmd in &commands {
            if cmd == -1 {
                dir = (dir + 1) % 4;
            } else if cmd == -2 {
                dir = (dir + 3) % 4;
            } else {
                let mut steps = cmd;
                while steps > 0 {
                    let nx = x + directions[dir].0;
                    let ny = y + directions[dir].1;

                    if blocked.contains(&(nx, ny)) {
                        break;
                    }

                    x = nx;
                    y = ny;

                    max_dist = max_dist.max(x * x + y * y);
                    steps -= 1;
                }
            }
        }

        max_dist
    }
}
