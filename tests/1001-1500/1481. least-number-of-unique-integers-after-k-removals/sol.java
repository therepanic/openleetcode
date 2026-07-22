class Solution {
    public int findLeastNumOfUniqueInts(int[] arr, int k) {
        java.util.Map<Integer, Integer> counts = new java.util.HashMap<>();
        for (int num : arr) {
            counts.put(num, counts.getOrDefault(num, 0) + 1);
        }
        int remaining = counts.size();
        java.util.List<Integer> frequencies = new java.util.ArrayList<>(counts.values());
        java.util.Collections.sort(frequencies);
        for (int count : frequencies) {
            if (k < count) {
                break;
            }
            k -= count;
            remaining--;
        }
        return remaining;
    }
}
