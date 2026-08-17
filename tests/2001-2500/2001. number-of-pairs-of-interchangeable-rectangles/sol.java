class Solution {
    public long interchangeableRectangles(int[][] rectangles) {
        java.util.HashMap<Pair<Integer, Integer>, Integer> ratioCount = new java.util.HashMap<>();
        long result = 0;
        
        for (int[] rect : rectangles) {
            int width = rect[0], height = rect[1];
            int g = gcd(width, height);
            Pair<Integer, Integer> reduced = new Pair<>(width / g, height / g);
            result += ratioCount.getOrDefault(reduced, 0);
            ratioCount.put(reduced, ratioCount.getOrDefault(reduced, 0) + 1);
        }
        
        return result;
    }
    
    private int gcd(int a, int b) {
        while (b != 0) {
            int temp = a % b;
            a = b;
            b = temp;
        }
        return a;
    }
}
