class Solution {
    private java.util.Map<String, Double> memo;
    
    public double soupServings(int n) {
        if (n > 5000) {
            return 1.0;
        }
        int units = (int) Math.ceil(n / 25.0);
        memo = new java.util.HashMap<>();
        return calcProb(units, units);
    }
    
    private double calcProb(int soupA, int soupB) {
        String key = soupA + "," + soupB;
        if (memo.containsKey(key)) {
            return memo.get(key);
        }
        if (soupA <= 0 && soupB <= 0) {
            return 0.5;
        }
        if (soupA <= 0) {
            return 1.0;
        }
        if (soupB <= 0) {
            return 0.0;
        }
        double result = 0.25 * (
            calcProb(soupA - 4, soupB) +
            calcProb(soupA - 3, soupB - 1) +
            calcProb(soupA - 2, soupB - 2) +
            calcProb(soupA - 1, soupB - 3)
        );
        memo.put(key, result);
        return result;
    }
}
