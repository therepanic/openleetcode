class Solution {
  int oddEvenJumps(List<int> arr) {
    int n = arr.length;
    List<int?> nextHigher = List.filled(n, null);
    List<int?> nextLower = List.filled(n, null);
    
    List<int> indices = List.generate(n, (i) => i);
    indices.sort((a, b) => arr[a].compareTo(arr[b]));
    List<int> stack = [];
    for (int i in indices) {
      while (stack.isNotEmpty && i > stack.last) {
        nextHigher[stack.removeLast()] = i;
      }
      stack.add(i);
    }
    
    indices.sort((a, b) => arr[b].compareTo(arr[a]));
    stack.clear();
    for (int i in indices) {
      while (stack.isNotEmpty && i > stack.last) {
        nextLower[stack.removeLast()] = i;
      }
      stack.add(i);
    }
    
    List<bool> odd = List.filled(n, false);
    List<bool> even = List.filled(n, false);
    odd[n - 1] = true;
    even[n - 1] = true;
    
    int result = 1;
    for (int i = n - 2; i >= 0; i--) {
      if (nextHigher[i] != null) {
        odd[i] = even[nextHigher[i]!];
      }
      if (nextLower[i] != null) {
        even[i] = odd[nextLower[i]!];
      }
      if (odd[i]) result++;
    }
    return result;
  }
}
