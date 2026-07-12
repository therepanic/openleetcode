class Solution {
  int threeSumMulti(List<int> arr, int target) {
    arr.sort();
    Map<int, int> cnt = {};
    for (int x in arr) {
      cnt[x] = (cnt[x] ?? 0) + 1;
    }
    int res = 0;
    int i = 0, l = arr.length;
    const int MOD = 1000000007;
    
    while (i < l) {
      int j = i, k = l - 1;
      
      while (j < k) {
        int s = arr[i] + arr[j] + arr[k];
        if (s < target) {
          j += cnt[arr[j]]!;
        } else if (s > target) {
          k -= cnt[arr[k]]!;
        } else {
          if (arr[i] != arr[j] && arr[j] != arr[k]) {
            res = (res + cnt[arr[i]]! * cnt[arr[j]]! * cnt[arr[k]]!) % MOD;
          } else if (arr[i] == arr[j] && arr[j] != arr[k]) {
            int c = cnt[arr[i]]!;
            res = (res + c * (c - 1) * cnt[arr[k]]! ~/ 2) % MOD;
          } else if (arr[i] != arr[j] && arr[j] == arr[k]) {
            int c = cnt[arr[j]]!;
            res = (res + cnt[arr[i]]! * c * (c - 1) ~/ 2) % MOD;
          } else {
            int c = cnt[arr[i]]!;
            res = (res + c * (c - 1) * (c - 2) ~/ 6) % MOD;
          }
          j += cnt[arr[j]]!;
          k -= cnt[arr[k]]!;
        }
      }
      
      i += cnt[arr[i]]!;
    }
    
    return res;
  }
}
