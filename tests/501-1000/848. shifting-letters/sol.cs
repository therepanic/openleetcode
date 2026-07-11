public class Solution {
    public string ShiftingLetters(string s, int[] shifts) {
        int n = shifts.Length;
        int[] l = new int[n];
        int z = 0;
        for (int i = n - 1; i >= 0; i--) {
            z = (z + shifts[i]) % 26;
            l[i] = z;
        }
        int[] p = new int[n];
        for (int i = 0; i < n; i++) {
            p[i] = s[i] - 'a';
        }
        char[] result = new char[n];
        for (int i = 0; i < n; i++) {
            result[i] = (char)(((p[i] + l[i]) % 26) + 'a');
        }
        return new string(result);
    }
}
