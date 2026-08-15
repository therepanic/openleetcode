class Solution {
    public int longestBeautifulSubstring(String word) {
        int n = word.length();
        int i = 0;
        int length = 0;

        while (i < n) {
            if (word.charAt(i) != 'a') {
                i++;
                continue;
            }

            int j = i;
            int unique = 1;
            while (j + 1 < n && word.charAt(j + 1) >= word.charAt(j)) {
                if (word.charAt(j + 1) != word.charAt(j)) {
                    unique++;
                }
                j++;
            }

            if (unique == 5) {
                length = Math.max(length, j - i + 1);
            }

            i = j + 1;
        }

        return length;
    }
}
