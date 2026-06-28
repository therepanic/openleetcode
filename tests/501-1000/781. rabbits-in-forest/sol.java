class Solution {
    public int numRabbits(int[] answers) {
        Map<Integer, Integer> mpp = new HashMap<>();
        for (int a : answers) {
            mpp.put(a, mpp.getOrDefault(a, 0) + 1);
        }
        int total = 0;
        for (Map.Entry<Integer, Integer> entry : mpp.entrySet()) {
            int x = entry.getKey();
            int count = entry.getValue();
            total += (int)Math.ceil((double)count / (x + 1)) * (x + 1);
        }
        return total;
    }
}
