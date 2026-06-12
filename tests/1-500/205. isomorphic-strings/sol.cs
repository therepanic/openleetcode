public class Solution {
    public bool IsIsomorphic(string s, string t) {
        int[] st = new int[256];
        int[] ts = new int[256];
        System.Array.Fill(st, -1);
        System.Array.Fill(ts, -1);
        for (int i = 0; i < s.Length; i++) {
            int a = s[i], b = t[i];
            if (st[a] != ts[b]) return false;
            st[a] = ts[b] = i;
        }
        return true;
    }
}
