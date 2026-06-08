class Solution {
  List<String> restoreIpAddresses(String s) {
    final result = <String>[];
    final current = <String>[];

    bool isValid(String segment) {
      if (segment.length > 1 && segment[0] == '0') {
        return false;
      }
      return int.parse(segment) <= 255;
    }

    void backtrack(int index) {
      if (current.length == 4) {
        if (index == s.length) {
          result.add(current.join('.'));
        }
        return;
      }

      for (int length = 1; length <= 3 && index + length <= s.length; length++) {
        final segment = s.substring(index, index + length);
        if (isValid(segment)) {
          current.add(segment);
          backtrack(index + length);
          current.removeLast();
        }
      }
    }

    backtrack(0);
    return result;
  }
}
