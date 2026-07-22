class Solution {
  String largestMultipleOfThree(List<int> digits) {
    var counts = List.filled(10, 0);
    for (var digit in digits) {
      counts[digit]++;
    }

    var sum = 0;
    for (var i = 0; i < 10; i++) {
      sum += i * counts[i];
    }
    var remainder = sum % 3;

    bool removeSmallest(List<int> group, int amount) {
      var amt = amount;
      for (var digit in group) {
        while (amt > 0 && counts[digit] > 0) {
          counts[digit]--;
          amt--;
        }
      }
      return amt == 0;
    }

    if (remainder == 1) {
      if (!removeSmallest([1, 4, 7], 1)) {
        removeSmallest([2, 5, 8], 2);
      }
    } else if (remainder == 2) {
      if (!removeSmallest([2, 5, 8], 1)) {
        removeSmallest([1, 4, 7], 2);
      }
    }

    var sb = StringBuffer();
    for (var i = 9; i >= 0; i--) {
      for (var j = 0; j < counts[i]; j++) {
        sb.write(i);
      }
    }
    var result = sb.toString();
    return result.startsWith('0') ? '0' : result;
  }
}
