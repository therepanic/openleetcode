class Solution {
    public int threeSumMulti(int[] arr, int target) {
        Arrays.sort(arr);
        Map<Integer, Integer> cnt = new HashMap<>();
        for (int x : arr) {
            cnt.put(x, cnt.getOrDefault(x, 0) + 1);
        }
        long res = 0;
        int i = 0, l = arr.length;
        int MOD = 1_000_000_007;
        
        while (i < l) {
            int j = i, k = l - 1;
            
            while (j < k) {
                int s = arr[i] + arr[j] + arr[k];
                if (s < target) {
                    j += cnt.get(arr[j]);
                } else if (s > target) {
                    k -= cnt.get(arr[k]);
                } else {
                    if (arr[i] != arr[j] && arr[j] != arr[k]) {
                        res += (long) cnt.get(arr[i]) * cnt.get(arr[j]) * cnt.get(arr[k]);
                    } else if (arr[i] == arr[j] && arr[j] != arr[k]) {
                        res += (long) cnt.get(arr[i]) * (cnt.get(arr[i]) - 1) * cnt.get(arr[k]) / 2;
                    } else if (arr[i] != arr[j] && arr[j] == arr[k]) {
                        res += (long) cnt.get(arr[i]) * cnt.get(arr[j]) * (cnt.get(arr[j]) - 1) / 2;
                    } else {
                        long c = cnt.get(arr[i]);
                        res += c * (c - 1) * (c - 2) / 6;
                    }
                    j += cnt.get(arr[j]);
                    k -= cnt.get(arr[k]);
                }
            }
            
            i += cnt.get(arr[i]);
        }
        
        return (int) (res % MOD);
    }
}
