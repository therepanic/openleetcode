class Solution {
    public int countBalls(int lowLimit, int highLimit) {
        Map<Integer, Integer> boxCount = new HashMap<>();
        int maxBalls = 0;
        for (int num = lowLimit; num <= highLimit; num++) {
            int box = 0;
            int temp = num;
            while (temp > 0) {
                box += temp % 10;
                temp /= 10;
            }
            boxCount.put(box, boxCount.getOrDefault(box, 0) + 1);
            maxBalls = Math.max(maxBalls, boxCount.get(box));
        }
        return maxBalls;
    }
}
