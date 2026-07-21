class Solution {
    public int mctFromLeafValues(int[] arr) {
        int result = 0;
        java.util.Stack<Integer> st = new java.util.Stack<>();
        st.push(Integer.MAX_VALUE);

        for (int a : arr) {
            while (st.peek() <= a) {
                int mid = st.pop();
                result += mid * Math.min(st.peek(), a);
            }
            st.push(a);
        }

        int first = st.pop();
        while (st.size() > 1) {
            result += first * st.peek();
            first = st.pop();
        }

        return result;
    }
}
