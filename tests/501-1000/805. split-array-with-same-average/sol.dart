class Solution {
  bool splitArraySameAverage(List<int> nums) {
    int n = nums.length;
    if (n < 2) return false;
    int total = nums.reduce((a, b) => a + b);
    List<int> transformed = nums.map((v) => v * n - total).toList();
    
    int mid = n >> 1;
    Map<int, Set<int>> generate(List<int> arr) {
      Map<int, Set<int>> mp = {};
      for (int mask = 1; mask < (1 << arr.length); mask++) {
        int sum = 0, cnt = 0;
        for (int i = 0; i < arr.length; i++) {
          if ((mask & (1 << i)) != 0) {
            sum += arr[i];
            cnt++;
          }
        }
        mp.putIfAbsent(cnt, () => <int>{});
        mp[cnt]!.add(sum);
      }
      return mp;
    }
    
    Map<int, Set<int>> mpA = generate(transformed.sublist(0, mid));
    Map<int, Set<int>> mpB = generate(transformed.sublist(mid));
    
    for (var entry in mpA.entries) {
      if (entry.value.contains(0) && entry.key != 0) return true;
    }
    for (var entry in mpB.entries) {
      if (entry.value.contains(0) && entry.key != 0) return true;
    }
    
    for (var entryA in mpA.entries) {
      for (var entryB in mpB.entries) {
        int totalCnt = entryA.key + entryB.key;
        if (totalCnt == 0 || totalCnt == n) continue;
        for (int v in entryA.value) {
          if (entryB.value.contains(-v)) return true;
        }
      }
    }
    return false;
  }
}
