class Solution {
    public List<List<Integer>> kSmallestPairs(int[] nums1, int[] nums2, int k) {
        List<List<Integer>> result = new ArrayList<>();
        if (nums1.length == 0 || nums2.length == 0) {
            return result;
        }

        PriorityQueue<int[]> pq = new PriorityQueue<>((a, b) -> {
            if (a[0] != b[0]) return Integer.compare(a[0], b[0]);
            if (a[1] != b[1]) return Integer.compare(a[1], b[1]);
            return Integer.compare(a[2], b[2]);
        });
        Set<String> visited = new HashSet<>();

        pq.offer(new int[]{nums1[0] + nums2[0], 0, 0});
        visited.add("0,0");

        while (!pq.isEmpty() && result.size() < k) {
            int[] cur = pq.poll();
            int i = cur[1], j = cur[2];
            result.add(Arrays.asList(nums1[i], nums2[j]));

            if (j + 1 < nums2.length && visited.add(i + "," + (j + 1))) {
                pq.offer(new int[]{nums1[i] + nums2[j + 1], i, j + 1});
            }

            if (i + 1 < nums1.length && visited.add((i + 1) + "," + j)) {
                pq.offer(new int[]{nums1[i + 1] + nums2[j], i + 1, j});
            }
        }

        return result;
    }
}
