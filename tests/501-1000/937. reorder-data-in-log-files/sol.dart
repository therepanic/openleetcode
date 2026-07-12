class Solution {
  List<String> reorderLogFiles(List<String> logs) {
    logs.sort((log1, log2) {
      var split1 = log1.split(' ');
      var split2 = log2.split(' ');
      var ident1 = split1[0];
      var ident2 = split2[0];
      var rest1 = split1.sublist(1).join(' ');
      var rest2 = split2.sublist(1).join(' ');
      bool isDigit1 = rest1[0].contains(RegExp(r'\d'));
      bool isDigit2 = rest2[0].contains(RegExp(r'\d'));
      if (!isDigit1 && !isDigit2) {
        int cmp = rest1.compareTo(rest2);
        if (cmp != 0) return cmp;
        return ident1.compareTo(ident2);
      }
      if (isDigit1 && isDigit2) return 0;
      return isDigit1 ? 1 : -1;
    });
    return logs;
  }
}
