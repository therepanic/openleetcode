class Solution {
  int scoreOfStudents(String s, List<int> answers) {
    final memo = <String, Set<int>>{};
    
    Set<int> fn(int lo, int hi) {
      final key = '$lo,$hi';
      if (memo.containsKey(key)) return memo[key]!;
      if (lo + 1 == hi) {
        final tmp = <int>{int.parse(s[lo])};
        memo[key] = tmp;
        return tmp;
      }
      final ans = <int>{};
      for (int mid = lo + 1; mid < hi; mid += 2) {
        for (final x in fn(lo, mid)) {
          for (final y in fn(mid + 1, hi)) {
            if (s[mid] == '+' && x + y <= 1000) {
              ans.add(x + y);
            } else if (s[mid] == '*' && x * y <= 1000) {
              ans.add(x * y);
            }
          }
        }
      }
      memo[key] = ans;
      return ans;
    }
    
    // evaluate target with precedence
    final nums = <int>[];
    final ops = <String>[];
    for (int i = 0; i < s.length; i++) {
      final c = s[i];
      if (RegExp(r'[0-9]').hasMatch(c)) {
        nums.add(int.parse(c));
      } else if (c == '+' || c == '*') {
        while (ops.isNotEmpty && precedence(ops.last) >= precedence(c)) {
          apply(nums, ops);
        }
        ops.add(c);
      }
    }
    while (ops.isNotEmpty) apply(nums, ops);
    final target = nums.last;
    
    final cand = fn(0, s.length);
    int score = 0;
    for (final x in answers) {
      if (x == target) score += 5;
      else if (cand.contains(x)) score += 2;
    }
    return score;
  }
  
  int precedence(String c) => c == '*' ? 2 : 1;
  
  void apply(List<int> nums, List<String> ops) {
    final b = nums.removeLast();
    final a = nums.removeLast();
    final op = ops.removeLast();
    nums.add(op == '+' ? a + b : a * b);
  }
}
