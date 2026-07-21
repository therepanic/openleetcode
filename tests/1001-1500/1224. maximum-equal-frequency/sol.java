class Solution {
    public int maxEqualFreq(int[] nums) {
        java.util.Map<Integer, Integer> counts = new java.util.HashMap<>();
        java.util.Map<Integer, Integer> frequencyCounts = new java.util.HashMap<>();
        int best = 0;

        for (int i = 0; i < nums.length; i++) {
            int value = nums[i];
            int index = i + 1;
            int previous = counts.getOrDefault(value, 0);
            if (previous > 0) {
                frequencyCounts.put(previous, frequencyCounts.get(previous) - 1);
                if (frequencyCounts.get(previous) == 0) {
                    frequencyCounts.remove(previous);
                }
            }
            counts.put(value, previous + 1);
            int frequency = previous + 1;
            frequencyCounts.put(frequency, frequencyCounts.getOrDefault(frequency, 0) + 1);

            if (frequencyCounts.size() == 1) {
                java.util.Map.Entry<Integer, Integer> entry = frequencyCounts.entrySet().iterator().next();
                int onlyFrequency = entry.getKey();
                int valueCount = entry.getValue();
                if (onlyFrequency == 1 || valueCount == 1) {
                    best = index;
                }
            } else if (frequencyCounts.size() == 2) {
                Integer[] keys = frequencyCounts.keySet().toArray(new Integer[0]);
                java.util.Arrays.sort(keys);
                int low = keys[0];
                int high = keys[1];
                if ((low == 1 && frequencyCounts.get(low) == 1) || (high == low + 1 && frequencyCounts.get(high) == 1)) {
                    best = index;
                }
            }
        }

        return best;
    }
}
