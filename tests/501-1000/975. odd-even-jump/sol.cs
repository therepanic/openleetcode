public class Solution {
    public int OddEvenJumps(int[] arr) {
        int n = arr.Length;
        int[] nextHigher = new int[n];
        int[] nextLower = new int[n];
        Array.Fill(nextHigher, -1);
        Array.Fill(nextLower, -1);
        
        int[] indices = new int[n];
        for (int i = 0; i < n; i++) indices[i] = i;
        
        Array.Sort(indices, (a, b) => arr[a].CompareTo(arr[b]));
        Stack<int> stack = new Stack<int>();
        foreach (int i in indices) {
            while (stack.Count > 0 && i > stack.Peek()) {
                nextHigher[stack.Pop()] = i;
            }
            stack.Push(i);
        }
        
        Array.Sort(indices, (a, b) => arr[b].CompareTo(arr[a]));
        stack.Clear();
        foreach (int i in indices) {
            while (stack.Count > 0 && i > stack.Peek()) {
                nextLower[stack.Pop()] = i;
            }
            stack.Push(i);
        }
        
        bool[] odd = new bool[n];
        bool[] even = new bool[n];
        odd[n - 1] = true;
        even[n - 1] = true;
        
        int result = 1;
        for (int i = n - 2; i >= 0; i--) {
            if (nextHigher[i] != -1) {
                odd[i] = even[nextHigher[i]];
            }
            if (nextLower[i] != -1) {
                even[i] = odd[nextLower[i]];
            }
            if (odd[i]) result++;
        }
        return result;
    }
}
