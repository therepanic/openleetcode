class Solution {
    public int maxSumRangeQuery(int[] nums, int[][] requests) {
        List<int[]> events = new ArrayList<>();
        int mod = 1000000007;
        
        for (int[] req : requests) {
            events.add(new int[]{req[0], 1});
            events.add(new int[]{req[1]+1, -1});
        }
        
        events.sort((a, b) -> Integer.compare(a[0], b[0]));
        
        int cnt = 0;
        int prev = -1;
        Map<Integer, Long> weight = new HashMap<>();
        
        for (int[] e : events) {
            if (prev != -1 && cnt != 0) {
                weight.put(cnt, weight.getOrDefault(cnt, 0L) + (e[0] - prev));
            }
            prev = e[0];
            cnt += e[1];
        }
        
        List<Map.Entry<Integer, Long>> sorted = new ArrayList<>(weight.entrySet());
        sorted.sort((a, b) -> Integer.compare(b.getKey(), a.getKey()));
        
        Arrays.sort(nums);
        // reverse
        for (int i = 0, j = nums.length-1; i < j; i++, j--) {
            int tmp = nums[i];
            nums[i] = nums[j];
            nums[j] = tmp;
        }
        
        long ans = 0;
        int idx = 0;
        
        for (Map.Entry<Integer, Long> entry : sorted) {
            long wg = entry.getKey();
            long num = entry.getValue();
            for (long k = 0; k < num; k++) {
                ans = (ans + (long)nums[idx] * wg) % mod;
                idx++;
            }
        }
        
        return (int)ans;
    }
}
