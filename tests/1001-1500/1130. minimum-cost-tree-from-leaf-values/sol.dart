class Solution {
  int mctFromLeafValues(List<int> arr) {
    int result = 0;
    List<int> st = [double.maxFinite.toInt()];

    for (int a in arr) {
      while (st.last <= a) {
        int mid = st.removeLast();
        result += mid * (st.last < a ? st.last : a);
      }
      st.add(a);
    }

    int first = st.removeLast();
    while (st.length > 1) {
      result += first * st.last;
      first = st.removeLast();
    }

    return result;
  }
}
