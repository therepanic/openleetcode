class Solution {
  int arrayPairSum(List<int> nums) {
    List<int> bucket = List.filled(20001, 0);
    for (int x in nums) {
      bucket[x + 10000]++;
    }
    int res = 0;
    bool flag = true;
    for (int i = 0; i < 20001; i++) {
      while (bucket[i] > 0) {
        if (flag) {
          res += i - 10000;
        }
        flag = !flag;
        bucket[i]--;
      }
    }
    return res;
  }
}
