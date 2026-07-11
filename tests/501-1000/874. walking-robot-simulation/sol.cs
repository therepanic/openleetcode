public class Solution {
    public int RobotSim(int[] commands, int[][] obstacles) {
        var blocked = new HashSet<string>();
        foreach (var o in obstacles) {
            blocked.Add($"{o[0]},{o[1]}");
        }

        int[][] directions = new int[][] {
            new int[] {0, 1}, new int[] {1, 0}, new int[] {0, -1}, new int[] {-1, 0}
        };

        int x = 0, y = 0;
        int dir = 0;
        int maxDist = 0;

        foreach (int cmd in commands) {
            if (cmd == -1) {
                dir = (dir + 1) % 4;
            } else if (cmd == -2) {
                dir = (dir + 3) % 4;
            } else {
                int steps = cmd;
                while (steps > 0) {
                    int nx = x + directions[dir][0];
                    int ny = y + directions[dir][1];

                    if (blocked.Contains($"{nx},{ny}")) {
                        break;
                    }

                    x = nx;
                    y = ny;

                    maxDist = Math.Max(maxDist, x * x + y * y);
                    steps--;
                }
            }
        }

        return maxDist;
    }
}
