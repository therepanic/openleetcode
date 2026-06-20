class Solution {
  int strongPasswordChecker(String password) {
    var lowercase = Set.from('abcdefghijklmnopqrstuvwxyz'.split(''));
    var uppercase = Set.from('ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split(''));
    var digit = Set.from('0123456789'.split(''));
    
    var characters = Set.from(password.split(''));
    
    bool needsLowercase = !characters.any((c) => lowercase.contains(c));
    bool needsUppercase = !characters.any((c) => uppercase.contains(c));
    bool needsDigit = !characters.any((c) => digit.contains(c));
    int numRequiredTypeReplaces = (needsLowercase ? 1 : 0) + (needsUppercase ? 1 : 0) + (needsDigit ? 1 : 0);
    
    int numRequiredInserts = (6 - password.length).clamp(0, 100);
    int numRequiredDeletes = (password.length - 20).clamp(0, 100);
    
    List<int> groups = [];
    if (password.isNotEmpty) {
      int count = 1;
      for (int i = 1; i < password.length; i++) {
        if (password[i] == password[i-1]) {
          count++;
        } else {
          groups.add(count);
          count = 1;
        }
      }
      groups.add(count);
    }
    
    for (int d = 0; d < numRequiredDeletes; d++) {
      int argmin = -1;
      int minVal = 100;
      for (int i = 0; i < groups.length; i++) {
        int group = groups[i];
        int val;
        if (group >= 3) {
          val = group % 3;
        } else {
          val = 10 - group;
        }
        if (val < minVal) {
          minVal = val;
          argmin = i;
        }
      }
      if (argmin != -1) {
        groups[argmin]--;
      }
    }
    
    int numRequiredGroupReplaces = groups.fold(0, (sum, group) => sum + group ~/ 3);
    
    int maxVal = numRequiredTypeReplaces;
    if (numRequiredGroupReplaces > maxVal) maxVal = numRequiredGroupReplaces;
    if (numRequiredInserts > maxVal) maxVal = numRequiredInserts;
    
    return numRequiredDeletes + maxVal;
  }
}
