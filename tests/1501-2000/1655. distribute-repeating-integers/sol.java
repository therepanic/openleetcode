import java.util.*;

class Solution {
    public boolean canDistribute(int[] nums, int[] quantity) {
        Arrays.sort(quantity);
        int[] reversed = new int[quantity.length];
        for (int i = 0; i < quantity.length; i++) reversed[i] = quantity[quantity.length - 1 - i];
        quantity = reversed;
        
        Map<Integer, Integer> freqCounts = new HashMap<>();
        Map<Integer, Integer> freqMap = new HashMap<>();
        for (int n : nums) freqMap.put(n, freqMap.getOrDefault(n, 0) + 1);
        for (int f : freqMap.values()) freqCounts.put(f, freqCounts.getOrDefault(f, 0) + 1);
        
        return backtrack(0, freqCounts, quantity);
    }
    
    private boolean backtrack(int i, Map<Integer, Integer> freqCounts, int[] quantity) {
        if (i == quantity.length) return true;
        for (int freq : new ArrayList<>(freqCounts.keySet())) {
            int count = freqCounts.get(freq);
            if (freq >= quantity[i] && count > 0) {
                freqCounts.put(freq, count - 1);
                freqCounts.put(freq - quantity[i], freqCounts.getOrDefault(freq - quantity[i], 0) + 1);
                if (backtrack(i + 1, freqCounts, quantity)) return true;
                freqCounts.put(freq, count);
                int newFreq = freq - quantity[i];
                int newCount = freqCounts.get(newFreq);
                if (newCount == 1) freqCounts.remove(newFreq);
                else freqCounts.put(newFreq, newCount - 1);
            }
        }
        return false;
    }
}
