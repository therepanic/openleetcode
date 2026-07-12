class Solution {
    func isRobotBounded(_ instructions: String) -> Bool {
        let directions = [(0,1), (1,0), (0,-1), (-1,0)]
        var x = 0, y = 0, dirIndex = 0
        
        for instr in instructions {
            if instr == "G" {
                x += directions[dirIndex].0
                y += directions[dirIndex].1
            } else if instr == "L" {
                dirIndex = (dirIndex + 3) % 4
            } else if instr == "R" {
                dirIndex = (dirIndex + 1) % 4
            }
        }
        
        return (x == 0 && y == 0) || dirIndex != 0
    }
}
