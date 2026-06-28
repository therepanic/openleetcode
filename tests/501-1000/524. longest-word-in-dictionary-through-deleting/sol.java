class Solution {
    public String findLongestWord(String s, List<String> dictionary) {
        String ans = "";
        for (String word : dictionary) {
            int i = 0, j = 0;
            while (i < word.length() && j < s.length()) {
                if (word.charAt(i) == s.charAt(j)) {
                    i++;
                }
                j++;
            }
            if (i == word.length()) {
                if (word.length() > ans.length()) {
                    ans = word;
                } else if (word.length() == ans.length() && word.compareTo(ans) < 0) {
                    ans = word;
                }
            }
        }
        return ans;
    }
}
