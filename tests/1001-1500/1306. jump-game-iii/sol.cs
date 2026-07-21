public class Solution {
    public bool CanReach(int[] arr, int start) {
        var seen = new HashSet<int>();
        var queue = new Queue<int>();
        queue.Enqueue(start);
        while (queue.Count > 0) {
            int index = queue.Dequeue();
            if (index < 0 || index >= arr.Length || seen.Contains(index)) {
                continue;
            }
            if (arr[index] == 0) {
                return true;
            }
            seen.Add(index);
            queue.Enqueue(index + arr[index]);
            queue.Enqueue(index - arr[index]);
        }
        return false;
    }
}
