class Solution {
    public boolean canReach(int[] arr, int start) {
        java.util.Set<Integer> seen = new java.util.HashSet<>();
        java.util.Queue<Integer> queue = new java.util.LinkedList<>();
        queue.offer(start);
        while (!queue.isEmpty()) {
            int index = queue.poll();
            if (index < 0 || index >= arr.length || seen.contains(index)) {
                continue;
            }
            if (arr[index] == 0) {
                return true;
            }
            seen.add(index);
            queue.offer(index + arr[index]);
            queue.offer(index - arr[index]);
        }
        return false;
    }
}
