class Solution {
    public int minSetSize(int[] arr) {
        Map<Integer, Integer> freq = new HashMap<>();
        for (int num : arr) {
            freq.put(num, freq.getOrDefault(num, 0) + 1);
        }
        
        List<Integer> counts = new ArrayList<>(freq.values());
        counts.sort(Collections.reverseOrder());
        
        int sumRemoved = 0;
        int minSetSize = 0;
        for (int count : counts) {
            sumRemoved += count;
            minSetSize++;
            if (sumRemoved >= arr.length / 2) {
                return minSetSize;
            }
        }
        return minSetSize;
    }
}
