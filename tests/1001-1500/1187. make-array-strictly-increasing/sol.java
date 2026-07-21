class Solution {
    public int makeArrayIncreasing(int[] arr1, int[] arr2) {
        Arrays.sort(arr2);
        int n = arr1.length;
        Map<String, Integer> memo = new HashMap<>();
        
        int answer = dfs(0, Integer.MIN_VALUE, arr1, arr2, memo);
        return answer >= Integer.MAX_VALUE / 2 ? -1 : answer;
    }
    
    private int dfs(int i, int prevMax, int[] arr1, int[] arr2, Map<String, Integer> memo) {
        if (i == arr1.length) return 0;
        
        String key = i + "," + prevMax;
        if (memo.containsKey(key)) return memo.get(key);
        
        int j = bisectRight(arr2, prevMax);
        
        int ans = Integer.MAX_VALUE / 2;
        if (arr1[i] > prevMax) {
            ans = Math.min(ans, dfs(i + 1, arr1[i], arr1, arr2, memo));
        }
        if (j < arr2.length) {
            ans = Math.min(ans, dfs(i + 1, arr2[j], arr1, arr2, memo) + 1);
        }
        
        memo.put(key, ans);
        return ans;
    }
    
    private int bisectRight(int[] arr, int target) {
        int lo = 0, hi = arr.length;
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (arr[mid] <= target) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
}
