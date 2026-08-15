public class Solution {
    public int MinimumJumps(int[] forbidden, int a, int b, int x) {
        int idx = 1;
        int m = Math.Min(a, b);
        for (int i = 2; i <= m; i++) {
            if (a % i == 0 && b % i == 0) idx = i;
        }
        if (x % idx != 0) return -1;
        var q = new Queue<(int, int, int)>();
        q.Enqueue((0, 1, 0));
        var visited = new HashSet<int>();
        visited.Add(0);
        foreach (int f in forbidden) visited.Add(f);
        int top = forbidden.Max();
        int limit = top + x + a + b;
        while (q.Count > 0) {
            var cur = q.Dequeue();
            int curr = cur.Item1, prev = cur.Item2, step = cur.Item3;
            if (curr == x) return step;
            if (prev == 1) {
                int nb = curr - b;
                if (nb >= 0 && !visited.Contains(nb)) {
                    visited.Add(nb);
                    q.Enqueue((nb, -1, step + 1));
                }
            }
            int na = curr + a;
            if (na <= limit && !visited.Contains(na)) {
                visited.Add(na);
                q.Enqueue((na, 1, step + 1));
            }
        }
        return -1;
    }
}
