public class Solution {
    public string LargestMerge(string word1, string word2) {
        var res = new StringBuilder();
        int i = 0, j = 0;
        while (i < word1.Length && j < word2.Length) {
            if (word1[i] > word2[j]) {
                res.Append(word1[i]);
                i++;
            } else if (word1[i] < word2[j]) {
                res.Append(word2[j]);
                j++;
            } else {
                int p = i, q = j;
                while (p < word1.Length && q < word2.Length && word1[p] == word2[q]) {
                    p++;
                    q++;
                }
                if (q == word2.Length || (p < word1.Length && word1[p] > word2[q])) {
                    res.Append(word1[i]);
                    i++;
                } else {
                    res.Append(word2[j]);
                    j++;
                }
            }
        }
        while (i < word1.Length) {
            res.Append(word1[i]);
            i++;
        }
        while (j < word2.Length) {
            res.Append(word2[j]);
            j++;
        }
        return res.ToString();
    }
}
