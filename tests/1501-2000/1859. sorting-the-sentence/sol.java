class Solution {
    public String sortSentence(String s) {
        Map<Integer, String> words = new HashMap<>();
        for (String word : s.split(" ")) {
            int key = word.charAt(word.length() - 1) - '0';
            words.put(key, word.substring(0, word.length() - 1));
        }
        StringBuilder result = new StringBuilder();
        for (int i = 1; i <= 9; i++) {
            if (!words.containsKey(i)) continue;
            if (result.length() > 0) result.append(" ");
            result.append(words.get(i));
        }
        return result.toString();
    }
}
