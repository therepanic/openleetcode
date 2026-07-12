class Solution {
    public boolean isAlienSorted(String[] words, String order) {
        int[] orderMap = new int[26];
        for (int i = 0; i < order.length(); i++) {
            orderMap[order.charAt(i) - 'a'] = i;
        }

        for (int i = 0; i < words.length - 1; i++) {
            String w1 = words[i];
            String w2 = words[i + 1];

            int minLen = Math.min(w1.length(), w2.length());
            int j;
            for (j = 0; j < minLen; j++) {
                if (w1.charAt(j) != w2.charAt(j)) {
                    if (orderMap[w1.charAt(j) - 'a'] > orderMap[w2.charAt(j) - 'a']) {
                        return false;
                    }
                    break;
                }
            }
            if (j == minLen && w1.length() > w2.length()) {
                return false;
            }
        }

        return true;
    }
}
