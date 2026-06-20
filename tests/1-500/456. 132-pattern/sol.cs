public class Solution {
    public bool Find132pattern(int[] nums) {
        Stack<int[]> st = new Stack<int[]>();
        int cur_min = nums[0];

        for (int i = 1; i < nums.Length; i++) {
            int n = nums[i];
            while (st.Count > 0 && n >= st.Peek()[0]) {
                st.Pop();
            }
            
            if (st.Count > 0 && n > st.Peek()[1]) {
                return true;
            }
            
            st.Push(new int[] { n, cur_min });
            cur_min = Math.Min(cur_min, n);
        }
        
        return false;
    }
}
