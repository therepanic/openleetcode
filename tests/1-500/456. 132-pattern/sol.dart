class Solution {
  bool find132pattern(List<int> nums) {
    List<List<int>> st = [];
    int cur_min = nums[0];

    for (int i = 1; i < nums.length; i++) {
      int n = nums[i];
      while (st.isNotEmpty && n >= st.last[0]) {
        st.removeLast();
      }
      
      if (st.isNotEmpty && n > st.last[1]) {
        return true;
      }
      
      st.add([n, cur_min]);
      cur_min = n < cur_min ? n : cur_min;
    }
    
    return false;
  }
}
