public class Solution {
    public IList<int> FindAnagrams(string s, string p) {
        int n1 = s.Length, n2 = p.Length;
        IList<int> res = new List<int>();
        if (n1 < n2) return res;

        int[] a = new int[26];
        int[] b = new int[26];

        for (int i = 0; i < n2; i++) {
            a[p[i] - 'a']++;
            b[s[i] - 'a']++;
        }

        bool Equal(int[] x, int[] y) {
            for (int i = 0; i < 26; i++)
                if (x[i] != y[i]) return false;
            return true;
        }

        if (Equal(a, b)) res.Add(0);

        for (int i = n2; i < n1; i++) {
            b[s[i] - 'a']++;
            b[s[i - n2] - 'a']--;
            if (Equal(a, b)) res.Add(i - n2 + 1);
        }

        return res;
    }
}
