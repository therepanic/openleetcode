class Solution {
    public List<String> findAndReplacePattern(String[] words, String pattern) {
        List<Integer> counts = new ArrayList<>();
        for (int i = 0; i < pattern.length(); i++) {
            counts.add(pattern.indexOf(pattern.charAt(i)));
        }
        List<String> res = new ArrayList<>();
        for (String word : words) {
            List<Integer> count = new ArrayList<>();
            for (int i = 0; i < word.length(); i++) {
                count.add(word.indexOf(word.charAt(i)));
            }
            if (count.equals(counts)) {
                res.add(word);
            }
        }
        return res;
    }
}
