class Solution {
    public int[] topKFrequent(int[] nums, int k) {
        Map<Integer, int[]> freq = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            int x = nums[i];
            int[] data = freq.get(x);
            if (data == null) {
                freq.put(x, new int[] {1, i});
            } else {
                data[0]++;
            }
        }
        return freq.entrySet().stream()
                .sorted((a, b) -> {
                    int cmp = Integer.compare(b.getValue()[0], a.getValue()[0]);
                    return cmp != 0 ? cmp : Integer.compare(a.getValue()[1], b.getValue()[1]);
                })
                .map(Map.Entry::getKey)
                .limit(k)
                .mapToInt(Integer::intValue)
                .toArray();
    }
}
