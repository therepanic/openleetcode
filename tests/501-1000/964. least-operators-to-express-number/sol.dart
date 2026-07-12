class Solution {
  final Map<int, int> _memo = {};
  
  int leastOpsExpressTarget(int x, int target) {
    return _dfs(target, x);
  }
  
  int _dfs(int val, int x) {
    if (_memo.containsKey(val)) return _memo[val]!;
    if (val < x) {
      int res = [2 * val - 1, 2 * (x - val)].reduce((a, b) => a < b ? a : b);
      _memo[val] = res;
      return res;
    }
    
    int k = (log(val) / log(x)).floor();
    int pow = x.pow(k);
    int ans = k + _dfs(val - pow, x);
    
    int nextPow = pow * x;
    if (nextPow < 2 * val) {
      ans = [ans, k + 1 + _dfs(nextPow - val, x)].reduce((a, b) => a < b ? a : b);
    }
    
    _memo[val] = ans;
    return ans;
  }
}

extension on int {
  int pow(int exp) {
    int result = 1;
    for (int i = 0; i < exp; i++) {
      result *= this;
    }
    return result;
  }
}
