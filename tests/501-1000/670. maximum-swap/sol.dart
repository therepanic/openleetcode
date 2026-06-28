class Solution {
  int maximumSwap(int num) {
    var numList = num.toString().split('');
    var lastIndex = <int, int>{};
    for (int i = 0; i < numList.length; i++) {
      lastIndex[int.parse(numList[i])] = i;
    }
    for (int i = 0; i < numList.length; i++) {
      int d = int.parse(numList[i]);
      for (int x = 9; x > d; x--) {
        if (lastIndex.containsKey(x) && lastIndex[x]! > i) {
          var temp = numList[i];
          numList[i] = numList[lastIndex[x]!];
          numList[lastIndex[x]!] = temp;
          return int.parse(numList.join(''));
        }
      }
    }
    return num;
  }
}
