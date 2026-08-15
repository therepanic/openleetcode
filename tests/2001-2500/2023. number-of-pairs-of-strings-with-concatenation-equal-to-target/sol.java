class Solution {
    public int numOfPairs(String[] nums, String target) {
        Map<String, Integer> freq = new HashMap<>();
        for (String num : nums) {
            freq.put(num, freq.getOrDefault(num, 0) + 1);
        }

        int totalCnt = 0;

        for (String num : nums) {
            if (target.startsWith(num)) {
                String remain = target.substring(num.length());

                if (remain.equals(num)) {
                    totalCnt += freq.getOrDefault(remain, 0) - 1;
                } else {
                    totalCnt += freq.getOrDefault(remain, 0);
                }
            }
        }

        return totalCnt;
    }
}
