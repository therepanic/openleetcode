class Solution {
  List<bool> checkArithmeticSubarrays(List<int> nums, List<int> l, List<int> r) {
    List<bool> ans = [];
    for (int i = 0; i < l.length; i++) {
      List<int> sub = nums.sublist(l[i], r[i]+1)..sort();
      bool valid = true;
      if (sub.length > 2) {
        int d = sub[1] - sub[0];
        for (int j = 1; j < sub.length-1; j++) {
          if (sub[j+1] - sub[j] != d) {
            valid = false;
            break;
          }
        }
      }
      ans.add(valid);
    }
    return ans;
  }
}
