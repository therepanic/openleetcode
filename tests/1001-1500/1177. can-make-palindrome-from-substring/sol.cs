public class Solution {
    public IList<bool> CanMakePaliQueries(string s, int[][] queries) {
        int n = s.Length;
        int[] prefix = new int[n + 1];
        
        for (int i = 0; i < n; i++) {
            int bit = 1 << (s[i] - 'a');
            prefix[i + 1] = prefix[i] ^ bit;
        }
        
        IList<bool> res = new List<bool>();
        
        foreach (var query in queries) {
            int left = query[0];
            int right = query[1];
            int ki = query[2];
            
            int mask = prefix[right + 1] ^ prefix[left];
            int oddCount = 0;
            while (mask != 0) {
                oddCount += mask & 1;
                mask >>= 1;
            }
            
            if (oddCount <= 1 || ki >= oddCount / 2) {
                res.Add(true);
            } else {
                res.Add(false);
            }
        }
        
        return res;
    }
}
