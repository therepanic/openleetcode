public class Solution {
    public int MinCharacters(string a, string b) {
        int[] freqA = new int[26];
        int[] freqB = new int[26];

        foreach (char ch in a) freqA[ch - 'a']++;
        foreach (char ch in b) freqB[ch - 'a']++;

        int lenA = a.Length;
        int lenB = b.Length;
        int res = int.MaxValue;
        int sumA = 0, sumB = 0;

        for (int i = 0; i < 25; i++) {
            sumA += freqA[i];
            sumB += freqB[i];
            res = Math.Min(res, lenA - sumA + sumB);
            res = Math.Min(res, lenB - sumB + sumA);
        }

        for (int i = 0; i < 26; i++) {
            res = Math.Min(res, (lenA - freqA[i]) + (lenB - freqB[i]));
        }

        return res;
    }
}
