class Solution {
  int minStickers(List<String> stickers, String target) {
    final memo = <String, int>{};
    int dfs(int idx, String target) {
      if (target.isEmpty) return 0;
      if (idx == stickers.length) return 9999999;
      
      final key = '$idx,$target';
      if (memo.containsKey(key)) return memo[key]!;
      
      int result = dfs(idx + 1, target);
      
      final currentSticker = stickers[idx];
      var newTarget = target;
      bool somethingRemoved = false;
      for (final c in currentSticker.split('')) {
        final idxToRemove = newTarget.indexOf(c);
        if (idxToRemove != -1) {
          newTarget = newTarget.substring(0, idxToRemove) + newTarget.substring(idxToRemove + 1);
          somethingRemoved = true;
        }
      }
      
      if (somethingRemoved) {
        final subResult = dfs(idx, newTarget);
        if (subResult != 9999999 && 1 + subResult < result) {
          result = 1 + subResult;
        }
      }
      
      memo[key] = result;
      return result;
    }
    
    final result = dfs(0, target);
    return result == 9999999 ? -1 : result;
  }
}
