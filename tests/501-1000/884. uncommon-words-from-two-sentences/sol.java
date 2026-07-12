class Solution {
    public String[] uncommonFromSentences(String s1, String s2) {
        java.util.Map<String, Integer> count = new java.util.HashMap<>();
        for (String word : (s1 + " " + s2).split(" ")) {
            count.put(word, count.getOrDefault(word, 0) + 1);
        }
        java.util.List<String> result = new java.util.ArrayList<>();
        for (java.util.Map.Entry<String, Integer> entry : count.entrySet()) {
            if (entry.getValue() == 1) {
                result.add(entry.getKey());
            }
        }
        return result.toArray(new String[0]);
    }
}
