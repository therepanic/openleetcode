class Solution {
    public String largestMerge(String word1, String word2) {
        StringBuilder res = new StringBuilder();
        int i = 0, j = 0;
        while (i < word1.length() && j < word2.length()) {
            if (word1.charAt(i) > word2.charAt(j)) {
                res.append(word1.charAt(i));
                i++;
            } else if (word1.charAt(i) < word2.charAt(j)) {
                res.append(word2.charAt(j));
                j++;
            } else {
                int p = i, q = j;
                while (p < word1.length() && q < word2.length() && word1.charAt(p) == word2.charAt(q)) {
                    p++;
                    q++;
                }
                if (q == word2.length() || (p < word1.length() && word1.charAt(p) > word2.charAt(q))) {
                    res.append(word1.charAt(i));
                    i++;
                } else {
                    res.append(word2.charAt(j));
                    j++;
                }
            }
        }
        while (i < word1.length()) {
            res.append(word1.charAt(i));
            i++;
        }
        while (j < word2.length()) {
            res.append(word2.charAt(j));
            j++;
        }
        return res.toString();
    }
}
