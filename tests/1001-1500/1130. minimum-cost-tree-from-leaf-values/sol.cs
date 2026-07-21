public class Solution {
    public int MctFromLeafValues(int[] arr) {
        int result = 0;
        var st = new Stack<int>();
        st.Push(int.MaxValue);

        foreach (int a in arr) {
            while (st.Peek() <= a) {
                int mid = st.Pop();
                result += mid * Math.Min(st.Peek(), a);
            }
            st.Push(a);
        }

        int first = st.Pop();
        while (st.Count > 1) {
            result += first * st.Peek();
            first = st.Pop();
        }

        return result;
    }
}
