class Solution {
    public int oddEvenJumps(int[] arr) {
        int n = arr.length;
        Integer[] nextHigher = new Integer[n];
        Integer[] nextLower = new Integer[n];
        
        Integer[] indices = new Integer[n];
        for (int i = 0; i < n; i++) indices[i] = i;
        
        Arrays.sort(indices, (a, b) -> arr[a] - arr[b]);
        Deque<Integer> stack = new ArrayDeque<>();
        for (int i : indices) {
            while (!stack.isEmpty() && i > stack.peek()) {
                nextHigher[stack.pop()] = i;
            }
            stack.push(i);
        }
        
        Arrays.sort(indices, (a, b) -> arr[b] - arr[a]);
        stack.clear();
        for (int i : indices) {
            while (!stack.isEmpty() && i > stack.peek()) {
                nextLower[stack.pop()] = i;
            }
            stack.push(i);
        }
        
        boolean[] odd = new boolean[n];
        boolean[] even = new boolean[n];
        odd[n - 1] = true;
        even[n - 1] = true;
        
        int result = 1;
        for (int i = n - 2; i >= 0; i--) {
            if (nextHigher[i] != null) {
                odd[i] = even[nextHigher[i]];
            }
            if (nextLower[i] != null) {
                even[i] = odd[nextLower[i]];
            }
            if (odd[i]) result++;
        }
        return result;
    }
}
