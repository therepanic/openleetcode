public class Solution {
    public string MinInteger(string num, int k) {
        int n = num.Length;
        var dict = new Dictionary<char, LinkedList<int>>();
        for (int i = 0; i < n; i++) {
            char ch = num[i];
            if (!dict.ContainsKey(ch)) dict[ch] = new LinkedList<int>();
            dict[ch].AddLast(i);
        }
        
        int[] bit = new int[n + 1];
        void Update(int i, int val) {
            while (i < bit.Length) {
                bit[i] += val;
                i += i & -i;
            }
        }
        int Query(int i) {
            int total = 0;
            while (i > 0) {
                total += bit[i];
                i -= i & -i;
            }
            return total;
        }
        
        for (int i = 1; i <= n; i++) Update(i, 1);
        
        var res = new System.Text.StringBuilder();
        int remaining = k;
        for (int pos = 0; pos < n; pos++) {
            for (char v = '0'; v <= '9'; v++) {
                if (dict.ContainsKey(v) && dict[v].Count > 0) {
                    int idx = dict[v].First.Value;
                    int cnt = Query(idx);
                    if (cnt <= remaining) {
                        dict[v].RemoveFirst();
                        remaining -= cnt;
                        res.Append(v);
                        Update(idx + 1, -1);
                        break;
                    }
                }
            }
        }
        return res.ToString();
    }
}
