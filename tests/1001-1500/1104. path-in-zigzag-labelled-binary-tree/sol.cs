public class Solution {
    public IList<int> PathInZigZagTree(int label) {
        var res = new List<int>();
        int cur = label;
        while (cur > 0) {
            res.Add(cur);
            int start = 1;
            while (start * 2 <= cur) {
                start *= 2;
            }
            int end = start * 2 - 1;
            cur = (start + end - cur) / 2;
        }
        res.Reverse();
        return res;
    }
}
