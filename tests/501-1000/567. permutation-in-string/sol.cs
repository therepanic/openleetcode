public class Solution {
    public bool CheckInclusion(string s1, string s2) {
        int n1 = s1.Length, n2 = s2.Length;
        if (n2 < n1) return false;

        int[] c1 = new int[26];
        int[] c2 = new int[26];

        for (int i = 0; i < n1; i++) {
            c1[s1[i] - 'a']++;
            c2[s2[i] - 'a']++;
        }

        if (c1.SequenceEqual(c2)) return true;

        for (int i = n1; i < n2; i++) {
            c2[s2[i] - 'a']++;
            c2[s2[i - n1] - 'a']--;

            if (c1.SequenceEqual(c2)) return true;
        }

        return false;
    }
}
