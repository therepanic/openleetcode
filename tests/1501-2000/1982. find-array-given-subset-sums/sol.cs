public class Solution {
    public int[] RecoverArray(int n, int[] sums) {
        Array.Sort(sums);
        int[] res = new int[n];
        
        for (int i = 0; i < n; i++) {
            int d = sums[1] - sums[0];
            
            var left = new List<int>();
            var right = new List<int>();
            var count = new Dictionary<int, int>();
            foreach (int s in sums) {
                if (!count.ContainsKey(s)) count[s] = 0;
                count[s]++;
            }
            
            foreach (int s in sums) {
                if (count[s] > 0) {
                    left.Add(s);
                    right.Add(s + d);
                    count[s]--;
                    if (!count.ContainsKey(s + d)) count[s + d] = 0;
                    count[s + d]--;
                }
            }
            
            if (left.Contains(0)) {
                res[i] = d;
                sums = left.ToArray();
            } else {
                res[i] = -d;
                sums = right.ToArray();
            }
        }
        return res;
    }
}
