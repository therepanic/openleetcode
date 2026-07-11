public class Solution {
    public int MinAreaRect(int[][] points) {
        var cols = new Dictionary<int, List<int>>();
        foreach (var point in points) {
            int x = point[0], y = point[1];
            if (!cols.ContainsKey(x)) cols[x] = new List<int>();
            cols[x].Add(y);
        }
        
        var lastX = new Dictionary<(int, int), int>();
        int best = int.MaxValue;
        var sortedX = new List<int>(cols.Keys);
        sortedX.Sort();
        
        foreach (int x in sortedX) {
            var ys = cols[x];
            ys.Sort();
            for (int i = 0; i < ys.Count; i++) {
                for (int j = i + 1; j < ys.Count; j++) {
                    var pair = (ys[i], ys[j]);
                    if (lastX.ContainsKey(pair)) {
                        int area = (x - lastX[pair]) * (ys[j] - ys[i]);
                        best = Math.Min(best, area);
                    }
                    lastX[pair] = x;
                }
            }
        }
        return best == int.MaxValue ? 0 : best;
    }
}
