public class Solution {
    public bool IsAlienSorted(string[] words, string order) {
        int[] orderMap = new int[26];
        for (int i = 0; i < order.Length; i++) {
            orderMap[order[i] - 'a'] = i;
        }

        for (int i = 0; i < words.Length - 1; i++) {
            string w1 = words[i];
            string w2 = words[i + 1];

            int minLen = Math.Min(w1.Length, w2.Length);
            int j;
            for (j = 0; j < minLen; j++) {
                if (w1[j] != w2[j]) {
                    if (orderMap[w1[j] - 'a'] > orderMap[w2[j] - 'a']) {
                        return false;
                    }
                    break;
                }
            }
            if (j == minLen && w1.Length > w2.Length) {
                return false;
            }
        }

        return true;
    }
}
