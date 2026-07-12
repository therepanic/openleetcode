class Solution {
    public List<String> commonChars(String[] words) {
        Map<Character, Integer> freq = new HashMap<>();
        for (char c : words[0].toCharArray()) {
            freq.put(c, freq.getOrDefault(c, 0) + 1);
        }
        for (int i = 1; i < words.length; i++) {
            Map<Character, Integer> f = new HashMap<>();
            for (char c : words[i].toCharArray()) {
                f.put(c, f.getOrDefault(c, 0) + 1);
            }
            for (char c : new HashSet<>(freq.keySet())) {
                if (f.containsKey(c)) {
                    freq.put(c, Math.min(f.get(c), freq.get(c)));
                } else {
                    freq.put(c, 0);
                }
            }
        }
        List<String> res = new ArrayList<>();
        for (Map.Entry<Character, Integer> entry : freq.entrySet()) {
            char c = entry.getKey();
            int count = entry.getValue();
            for (int j = 0; j < count; j++) {
                res.add(String.valueOf(c));
            }
        }
        return res;
    }
}
