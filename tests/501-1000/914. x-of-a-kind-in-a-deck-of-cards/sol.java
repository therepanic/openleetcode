class Solution {
    public boolean hasGroupsSizeX(int[] deck) {
        java.util.Map<Integer, Integer> counts = new java.util.HashMap<>();
        for (int card : deck) {
            counts.put(card, counts.getOrDefault(card, 0) + 1);
        }
        
        int currentGcd = -1;
        for (int count : counts.values()) {
            if (currentGcd == -1) {
                currentGcd = count;
            } else {
                currentGcd = gcd(currentGcd, count);
                if (currentGcd == 1) {
                    return false;
                }
            }
        }
        
        return currentGcd >= 2;
    }
    
    private int gcd(int a, int b) {
        while (b > 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }
}
