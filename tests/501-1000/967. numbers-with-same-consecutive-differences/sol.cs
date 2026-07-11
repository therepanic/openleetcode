public class Solution {
    public int[] NumsSameConsecDiff(int n, int k) {
        var res = new HashSet<int>();
        for (int x = 1; x <= 9; x++) {
            res.Add(x);
        }
        n -= 1;
        
        while (n > 0) {
            var next = new HashSet<int>();
            foreach (int val in res) {
                int last = val % 10;
                if (last + k < 10) {
                    next.Add(val * 10 + last + k);
                }
                if (last - k >= 0) {
                    next.Add(val * 10 + last - k);
                }
            }
            res = next;
            n -= 1;
        }
        
        int[] result = new int[res.Count];
        res.CopyTo(result);
        return result;
    }
}
