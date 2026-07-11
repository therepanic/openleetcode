class Solution {
    public String mostCommonWord(String paragraph, String[] banned) {
        Set<String> bannedSet = new HashSet<>(Arrays.asList(banned));
        Map<String, Integer> counts = new HashMap<>();
        String[] words = paragraph.toLowerCase().split("[^a-z]+");
        for (String w : words) {
            if (!w.isEmpty() && !bannedSet.contains(w)) {
                counts.put(w, counts.getOrDefault(w, 0) + 1);
            }
        }
        String result = "";
        int maxCount = 0;
        for (Map.Entry<String, Integer> entry : counts.entrySet()) {
            if (entry.getValue() > maxCount) {
                maxCount = entry.getValue();
                result = entry.getKey();
            }
        }
        return result;
    }
}
