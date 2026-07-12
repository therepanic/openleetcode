public class Solution {
    public bool IsRobotBounded(string instructions) {
        int[][] directions = new int[][] { new int[] {0,1}, new int[] {1,0}, new int[] {0,-1}, new int[] {-1,0} };
        int x = 0, y = 0, dirIndex = 0;
        
        foreach (char instr in instructions) {
            if (instr == 'G') {
                x += directions[dirIndex][0];
                y += directions[dirIndex][1];
            } else if (instr == 'L') {
                dirIndex = (dirIndex + 3) % 4;
            } else if (instr == 'R') {
                dirIndex = (dirIndex + 1) % 4;
            }
        }
        
        return (x == 0 && y == 0) || dirIndex != 0;
    }
}
