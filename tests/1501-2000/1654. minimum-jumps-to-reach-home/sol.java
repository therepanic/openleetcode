// (already provided)
class Solution {
    public int minimumJumps(int[] forbidden, int a, int b, int x) {
        int idx = 1;
        for (int i = 2; i <= Math.min(a, b); i++) {
            if (a % i == 0 && b % i == 0) idx = i;
        }
        if (x % idx != 0) return -1;
        java.util.ArrayDeque<int[]> q = new java.util.ArrayDeque<>();
        q.add(new int[]{0, 1, 0});
        java.util.Set<Integer> visited = new java.util.HashSet<>();
        visited.add(0);
        for (int f : forbidden) visited.add(f);
        int top = 0;
        for (int f : forbidden) top = Math.max(top, f);
        int limit = top + x + a + b;
        while (!q.isEmpty()) {
            int[] cur = q.poll();
            int curr = cur[0], prev = cur[1], step = cur[2];
            if (curr == x) return step;
            if (prev == 1) {
                int nb = curr - b;
                if (nb >= 0 && !visited.contains(nb)) {
                    visited.add(nb);
                    q.add(new int[]{nb, -1, step + 1});
                }
            }
            int na = curr + a;
            if (na <= limit && !visited.contains(na)) {
                visited.add(na);
                q.add(new int[]{na, 1, step + 1});
            }
        }
        return -1;
    }
}
