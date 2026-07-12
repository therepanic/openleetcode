class Solution {
    public int longestWPI(int[] hours) {
        int score = 0;
        int longestInterval = 0;
        java.util.Map<Integer, Integer> seenAt = new java.util.HashMap<>();
        seenAt.put(0, -1);
        
        for (int i = 0; i < hours.length; i++) {
            score += hours[i] > 8 ? 1 : -1;
            
            if (score > 0) {
                longestInterval = i + 1;
            } else if (seenAt.containsKey(score - 1)) {
                longestInterval = Math.max(longestInterval, i - seenAt.get(score - 1));
            }
            
            if (!seenAt.containsKey(score)) {
                seenAt.put(score, i);
            }
        }
        
        return longestInterval;
    }
}
