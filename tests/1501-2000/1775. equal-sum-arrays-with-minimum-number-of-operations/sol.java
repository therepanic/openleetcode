class Solution {
    public int minOperations(int[] nums1, int[] nums2) {
        int x = 0, y = 0;
        for (int v : nums1) x += v;
        for (int v : nums2) y += v;
        if (x == y) return 0;
        if (x < y) {
            if (6*nums1.length < nums2.length) return -1;
            List<Integer> gains = new ArrayList<>();
            for (int v : nums1) gains.add(6-v);
            for (int v : nums2) gains.add(v-1);
            gains.sort(Collections.reverseOrder());
            int diff = y - x;
            int ops = 0;
            for (int g : gains) {
                if (diff <= 0) break;
                diff -= g;
                ops++;
            }
            return diff <= 0 ? ops : -1;
        } else {
            if (6*nums2.length < nums1.length) return -1;
            List<Integer> gains = new ArrayList<>();
            for (int v : nums1) gains.add(v-1);
            for (int v : nums2) gains.add(6-v);
            gains.sort(Collections.reverseOrder());
            int diff = x - y;
            int ops = 0;
            for (int g : gains) {
                if (diff <= 0) break;
                diff -= g;
                ops++;
            }
            return diff <= 0 ? ops : -1;
        }
    }
}
