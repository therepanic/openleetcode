class Solution {
  bool validateStackSequences(List<int> pushed, List<int> popped) {
    List<int> st = [];
    int j = 0;
    for (int x in pushed) {
      st.add(x);
      while (st.isNotEmpty && j < popped.length && st.last == popped[j]) {
        st.removeLast();
        j++;
      }
    }
    return j == popped.length;
  }
}
