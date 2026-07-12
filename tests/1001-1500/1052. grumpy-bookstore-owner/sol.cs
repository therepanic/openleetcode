public class Solution {
    public int MaxSatisfied(int[] customers, int[] grumpy, int minutes) {
        int n = customers.Length;
        int totalSatisfied = 0;
        int currentWindowGain = 0;
        
        for (int i = 0; i < n; i++) {
            if (grumpy[i] == 0) {
                totalSatisfied += customers[i];
            } else if (i < minutes) {
                currentWindowGain += customers[i];
            }
        }
        
        int maxWindowGain = currentWindowGain;
        
        for (int i = minutes; i < n; i++) {
            if (grumpy[i] == 1) {
                currentWindowGain += customers[i];
            }
            if (grumpy[i - minutes] == 1) {
                currentWindowGain -= customers[i - minutes];
            }
            if (currentWindowGain > maxWindowGain) {
                maxWindowGain = currentWindowGain;
            }
        }
        
        return totalSatisfied + maxWindowGain;
    }
}
