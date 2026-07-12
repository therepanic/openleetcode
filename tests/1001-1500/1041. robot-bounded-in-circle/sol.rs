impl Solution {
    pub fn is_robot_bounded(instructions: String) -> bool {
        let directions = [(0,1), (1,0), (0,-1), (-1,0)];
        let mut x = 0;
        let mut y = 0;
        let mut dir_index = 0;
        
        for instr in instructions.chars() {
            if instr == 'G' {
                x += directions[dir_index].0;
                y += directions[dir_index].1;
            } else if instr == 'L' {
                dir_index = (dir_index + 3) % 4;
            } else if instr == 'R' {
                dir_index = (dir_index + 1) % 4;
            }
        }
        
        (x == 0 && y == 0) || dir_index != 0
    }
}
