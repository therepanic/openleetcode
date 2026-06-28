class Solution {
    public boolean isPossible(int[] nums) {
        Map<Integer, Integer> count = new HashMap<>();
        for (int num : nums) {
            count.put(num, count.getOrDefault(num, 0) + 1);
        }
        Map<Integer, Integer> subseq = new HashMap<>();

        for (int num : nums) {
            if (count.get(num) == 0) continue;
            if (subseq.getOrDefault(num - 1, 0) > 0) {
                subseq.put(num - 1, subseq.get(num - 1) - 1);
                subseq.put(num, subseq.getOrDefault(num, 0) + 1);
            } else if (count.getOrDefault(num + 1, 0) > 0 && count.getOrDefault(num + 2, 0) > 0) {
                count.put(num + 1, count.get(num + 1) - 1);
                count.put(num + 2, count.get(num + 2) - 1);
                subseq.put(num + 2, subseq.getOrDefault(num + 2, 0) + 1);
            } else {
                return false;
            }
            count.put(num, count.get(num) - 1);
        }

        return true;
    }
}
