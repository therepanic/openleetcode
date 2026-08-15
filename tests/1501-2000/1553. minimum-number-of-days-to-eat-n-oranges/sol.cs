public class Solution {
    public int MinDays(int n) {
        int ans = 0;
        var queue = new Queue<int>();
        queue.Enqueue(n);
        var seen = new HashSet<int>();
        while (queue.Count > 0) {
            int size = queue.Count;
            for (int i = 0; i < size; ++i) {
                int x = queue.Dequeue();
                if (x == 0) return ans;
                seen.Add(x);
                if (!seen.Contains(x-1)) queue.Enqueue(x-1);
                if (x % 2 == 0 && !seen.Contains(x/2)) queue.Enqueue(x/2);
                if (x % 3 == 0 && !seen.Contains(x/3)) queue.Enqueue(x/3);
            }
            ans++;
        }
        return ans;
    }
}
