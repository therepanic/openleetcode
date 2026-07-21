class Solution {
    public List<Integer> findNumOfValidWords(String[] words, String[] puzzles) {
        Map<Integer, Integer> wordCount = new HashMap<>();
        for (String w : words) {
            int mask = getMask(w);
            wordCount.put(mask, wordCount.getOrDefault(mask, 0) + 1);
        }
        
        List<Integer> result = new ArrayList<>();
        for (String p : puzzles) {
            int firstMask = 1 << (p.charAt(0) - 'a');
            int puzzleMask = getMask(p);
            int sub = puzzleMask;
            int count = 0;
            while (true) {
                if ((sub & firstMask) != 0) {
                    count += wordCount.getOrDefault(sub, 0);
                }
                if (sub == 0) break;
                sub = (sub - 1) & puzzleMask;
            }
            result.add(count);
        }
        return result;
    }
    
    private int getMask(String s) {
        int mask = 0;
        for (int i = 0; i < s.length(); i++) {
            mask |= 1 << (s.charAt(i) - 'a');
        }
        return mask;
    }
}
