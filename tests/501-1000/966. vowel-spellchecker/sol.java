class Solution {
    public String[] spellchecker(String[] wordlist, String[] queries) {
        Set<String> exact = new HashSet<>();
        Map<String, String> caseMap = new HashMap<>();
        Map<String, String> vowelMap = new HashMap<>();
        
        for (String w : wordlist) {
            exact.add(w);
            String lower = w.toLowerCase();
            String devowel = deVowel(lower);
            if (!caseMap.containsKey(lower)) {
                caseMap.put(lower, w);
            }
            if (!vowelMap.containsKey(devowel)) {
                vowelMap.put(devowel, w);
            }
        }
        
        String[] result = new String[queries.length];
        for (int i = 0; i < queries.length; i++) {
            String q = queries[i];
            if (exact.contains(q)) {
                result[i] = q;
            } else {
                String lower = q.toLowerCase();
                String devowel = deVowel(lower);
                if (caseMap.containsKey(lower)) {
                    result[i] = caseMap.get(lower);
                } else if (vowelMap.containsKey(devowel)) {
                    result[i] = vowelMap.get(devowel);
                } else {
                    result[i] = "";
                }
            }
        }
        return result;
    }
    
    private String deVowel(String s) {
        StringBuilder sb = new StringBuilder();
        for (char c : s.toCharArray()) {
            if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') {
                sb.append('*');
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }
}
