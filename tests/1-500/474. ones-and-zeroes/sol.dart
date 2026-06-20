class Solution {
  int findMaxForm(List<String> strs, int m, int n) {
    Map<String, int> dp = {'0,0': 0};
    for (var s in strs) {
      int zeros = '0'.allMatches(s).length;
      int ones = '1'.allMatches(s).length;
      Map<String, int> newDp = Map.from(dp);
      dp.forEach((key, size) {
        var parts = key.split(',');
        int z = int.parse(parts[0]);
        int o = int.parse(parts[1]);
        int newZ = z + zeros;
        int newO = o + ones;
        if (newZ <= m && newO <= n) {
          String newKey = '$newZ,$newO';
          newDp[newKey] = (newDp[newKey] ?? 0) > (size + 1) ? newDp[newKey]! : size + 1;
        }
      });
      dp = newDp;
    }
    return dp.values.reduce((a, b) => a > b ? a : b);
  }
}
