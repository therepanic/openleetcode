public class Solution {
    public int[] NextGreaterElement(int[] nums1, int[] nums2) {
        Dictionary<int, int> nextGreater = new Dictionary<int, int>();
        Stack<int> stack = new Stack<int>();
        
        for (int i = nums2.Length - 1; i >= 0; i--) {
            int num = nums2[i];
            while (stack.Count > 0 && stack.Peek() <= num) {
                stack.Pop();
            }
            nextGreater[num] = stack.Count == 0 ? -1 : stack.Peek();
            stack.Push(num);
        }
        
        int[] result = new int[nums1.Length];
        for (int i = 0; i < nums1.Length; i++) {
            result[i] = nextGreater[nums1[i]];
        }
        return result;
    }
}
