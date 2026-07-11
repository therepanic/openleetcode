public class Solution {
    public int Racecar(int target) {
        var q = new Queue<(int, int, int)>();
        q.Enqueue((0, 1, 0));
        while (q.Count > 0) {
            var (cp, cs, nm) = q.Dequeue();
            if (cp == target) return nm;
            q.Enqueue((cp + cs, cs * 2, nm + 1));
            if ((cp + cs > target && cs > 0) || (cp + cs < target && cs < 0)) {
                if (cs < 0) {
                    q.Enqueue((cp, 1, nm + 1));
                } else {
                    q.Enqueue((cp, -1, nm + 1));
                }
            }
        }
        return -1;
    }
}
