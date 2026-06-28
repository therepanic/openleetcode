class Solution {
  int deleteAndEarn(List<int> nums) {
    var count = <int, int>{};
    for (var num in nums) {
      count[num] = (count[num] ?? 0) + 1;
    }
    var uniqueNums = count.keys.toList()..sort();
    int? prev;
    int take = 0, skip = 0;

    for (var num in uniqueNums) {
      int maxPoints = skip > take ? skip : take;
      if (prev != null && prev == num - 1) {
        take = num * count[num]! + skip;
        skip = maxPoints;
      } else {
        take = num * count[num]! + maxPoints;
        skip = maxPoints;
      }
      prev = num;
    }

    return take > skip ? take : skip;
  }
}
