class Solution {
    public boolean splitArraySameAverage(int[] nums) {
        int n = nums.length;
        if (n < 2) return false;
        int total = 0;
        for (int num : nums) total += num;
        int[] transformed = new int[n];
        for (int i = 0; i < n; i++) {
            transformed[i] = nums[i] * n - total;
        }
        
        int mid = n >> 1;
        Map<Integer, Set<Integer>> mpA = new HashMap<>();
        int[] arr = Arrays.copyOfRange(transformed, 0, mid);
        int len = arr.length;
        for (int mask = 1; mask < (1 << len); mask++) {
            int sum = 0, cnt = 0;
            for (int i = 0; i < len; i++) {
                if ((mask & (1 << i)) != 0) {
                    sum += arr[i];
                    cnt++;
                }
            }
            mpA.computeIfAbsent(cnt, k -> new HashSet<>()).add(sum);
        }
        
        Map<Integer, Set<Integer>> mpB = new HashMap<>();
        arr = Arrays.copyOfRange(transformed, mid, n);
        len = arr.length;
        for (int mask = 1; mask < (1 << len); mask++) {
            int sum = 0, cnt = 0;
            for (int i = 0; i < len; i++) {
                if ((mask & (1 << i)) != 0) {
                    sum += arr[i];
                    cnt++;
                }
            }
            mpB.computeIfAbsent(cnt, k -> new HashSet<>()).add(sum);
        }
        
        for (int cnt : mpA.keySet()) {
            if (mpA.get(cnt).contains(0) && cnt != 0) return true;
        }
        for (int cnt : mpB.keySet()) {
            if (mpB.get(cnt).contains(0) && cnt != 0) return true;
        }
        
        for (int cntA : mpA.keySet()) {
            for (int cntB : mpB.keySet()) {
                int totalCnt = cntA + cntB;
                if (totalCnt == 0 || totalCnt == n) continue;
                for (int val : mpA.get(cntA)) {
                    if (mpB.get(cntB).contains(-val)) return true;
                }
            }
        }
        return false;
    }
}
