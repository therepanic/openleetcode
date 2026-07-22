public class Solution {
    public int LongestDecomposition(string text) {
        int i = 0, j = text.Length - 1, n = 0, count = 0;
        while (i <= j) {
            if (text[i] == text[j]) {
                if (text.Substring(i, n + 1) == text.Substring(j, n + 1)) {
                    count += 2;
                    i += n + 1;
                    j -= 1;
                    n = 0;
                    continue;
                }
            }
            j -= 1;
            n += 1;
        }
        return i == j + 1 ? count : count - 1;
    }
}
