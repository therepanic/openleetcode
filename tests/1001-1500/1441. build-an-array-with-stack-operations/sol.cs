public class Solution {
    public IList<string> BuildArray(int[] target, int n) {
        List<int> s = new List<int>();
        List<string> res = new List<string>();
        int a = 0;
        for (int i = 1; i <= n; i++) {
            if (s.SequenceEqual(target)) return res;
            s.Add(i);
            res.Add("Push");
            if (s[a] != target[a]) {
                s.RemoveAt(s.Count - 1);
                res.Add("Pop");
            } else {
                a++;
            }
        }
        return res;
    }
}
