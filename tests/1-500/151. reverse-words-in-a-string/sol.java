class Solution {
    public String reverseWords(String s) {
        String[] words = s.trim().split("\\s+");
        StringBuilder result = new StringBuilder();
        for (int i = words.length - 1; i >= 0; i--) {
            if (result.length() > 0) result.append(' ');
            result.append(words[i]);
        }
        return result.toString();
    }
}
