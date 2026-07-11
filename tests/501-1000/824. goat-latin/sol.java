class Solution {
    public String toGoatLatin(String sentence) {
        Set<Character> vowels = Set.of('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');
        String[] words = sentence.split(" ");
        StringBuilder ans = new StringBuilder();
        for (int i = 0; i < words.length; i++) {
            String word = words[i];
            StringBuilder goat = new StringBuilder();
            if (vowels.contains(word.charAt(0))) {
                goat.append(word);
            } else {
                goat.append(word.substring(1));
                goat.append(word.charAt(0));
            }
            goat.append("ma");
            goat.append("a".repeat(i + 1));
            if (ans.length() > 0) {
                ans.append(" ");
            }
            ans.append(goat);
        }
        return ans.toString();
    }
}
