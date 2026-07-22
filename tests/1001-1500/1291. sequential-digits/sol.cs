public class Solution {
    public IList<int> SequentialDigits(int low, int high) {
        List<int> q = new List<int>();
        for (int i = 1; i <= 9; i++) {
            q.Add(i);
        }
        for (int i = 0; i < q.Count; i++) {
            int x = q[i];
            int d = x % 10;
            if (d < 9) {
                q.Add(x * 10 + d + 1);
            }
        }
        List<int> result = new List<int>();
        foreach (int x in q) {
            if (low <= x && x <= high) {
                result.Add(x);
            }
        }
        return result;
    }
}
