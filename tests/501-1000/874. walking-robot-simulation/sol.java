class Solution {
    public int robotSim(int[] commands, int[][] obstacles) {
        Set<String> blocked = new HashSet<>();
        for (int[] o : obstacles) {
            blocked.add(o[0] + "," + o[1]);
        }

        int[][] directions = {
            {0, 1}, {1, 0}, {0, -1}, {-1, 0}
        };

        int x = 0, y = 0;
        int dir = 0;
        int maxDist = 0;

        for (int cmd : commands) {
            if (cmd == -1) {
                dir = (dir + 1) % 4;
            } else if (cmd == -2) {
                dir = (dir + 3) % 4;
            } else {
                while (cmd > 0) {
                    int nx = x + directions[dir][0];
                    int ny = y + directions[dir][1];

                    if (blocked.contains(nx + "," + ny)) {
                        break;
                    }

                    x = nx;
                    y = ny;

                    maxDist = Math.max(maxDist, x * x + y * y);
                    cmd--;
                }
            }
        }

        return maxDist;
    }
}
