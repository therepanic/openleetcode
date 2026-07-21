import java.util.ArrayDeque;
import java.util.ArrayList;

class Solution {
    public int minFlips(int[][] mat) {
        int m = mat.length;
        int n = mat[0].length;
        ArrayList<Integer> masks = new ArrayList<>(m * n);

        int[][] dirs = new int[][]{{0, 0}, {1, 0}, {-1, 0}, {0, 1}, {0, -1}};
        for (int r = 0; r < m; ++r) {
            for (int c = 0; c < n; ++c) {
                int mask = 0;
                for (int[] d : dirs) {
                    int nr = r + d[0];
                    int nc = c + d[1];
                    if (0 <= nr && nr < m && 0 <= nc && nc < n) {
                        mask |= 1 << (nr * n + nc);
                    }
                }
                masks.add(mask);
            }
        }

        int start = 0;
        for (int r = 0; r < m; ++r) {
            for (int c = 0; c < n; ++c) {
                if (mat[r][c] == 1) {
                    start |= 1 << (r * n + c);
                }
            }
        }

        int size = 1 << (m * n);
        int[] dist = new int[size];
        for (int i = 0; i < size; ++i) {
            dist[i] = -1;
        }
        ArrayDeque<Integer> q = new ArrayDeque<>();
        dist[start] = 0;
        q.add(start);

        while (!q.isEmpty()) {
            int state = q.removeFirst();
            int steps = dist[state];
            if (state == 0) {
                return steps;
            }
            for (int mask : masks) {
                int next = state ^ mask;
                if (dist[next] == -1) {
                    dist[next] = steps + 1;
                    q.addLast(next);
                }
            }
        }

        return -1;
    }
}
