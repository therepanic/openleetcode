class Solution {
    public int[] frequencySort(int[] nums) {
        java.util.Map<Integer, Integer> freq = new java.util.HashMap<>();
        for (int num : nums) {
            freq.put(num, freq.getOrDefault(num, 0) + 1);
        }
        return java.util.Arrays.stream(nums)
                .boxed()
                .sorted((a, b) -> {
                    int freqCompare = Integer.compare(freq.get(a), freq.get(b));
                    if (freqCompare != 0) return freqCompare;
                    return Integer.compare(b, a);
                })
                .mapToInt(Integer::intValue)
                .toArray();
    }
}
