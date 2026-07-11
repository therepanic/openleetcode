class Solution {
    public boolean validateStackSequences(int[] pushed, int[] popped) {
        java.util.Stack<Integer> st = new java.util.Stack<>();
        int j = 0;
        for (int x : pushed) {
            st.push(x);
            while (!st.empty() && j < popped.length && st.peek() == popped[j]) {
                st.pop();
                j++;
            }
        }
        return j == popped.length;
    }
}
