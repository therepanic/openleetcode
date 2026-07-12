public class Solution {
    public bool ValidateStackSequences(int[] pushed, int[] popped) {
        Stack<int> st = new Stack<int>();
        int j = 0;
        foreach (int x in pushed) {
            st.Push(x);
            while (st.Count > 0 && j < popped.Length && st.Peek() == popped[j]) {
                st.Pop();
                j++;
            }
        }
        return j == popped.Length;
    }
}
