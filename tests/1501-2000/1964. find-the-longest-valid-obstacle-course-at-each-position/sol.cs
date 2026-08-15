public class Solution {
    public int[] LongestObstacleCourseAtEachPosition(int[] obstacles) {
        List<int> tails = new List<int>();
        int[] res = new int[obstacles.Length];
        for (int i = 0; i < obstacles.Length; i++) {
            int x = obstacles[i];
            int idx = UpperBound(tails, x);
            res[i] = idx + 1;
            if (idx == tails.Count) {
                tails.Add(x);
            } else {
                tails[idx] = x;
            }
        }
        return res;
    }
    
    private int UpperBound(List<int> list, int target) {
        int lo = 0, hi = list.Count;
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (list[mid] <= target) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
}
