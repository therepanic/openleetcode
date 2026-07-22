class Solution {
    public int[] arrayRankTransform(int[] arr) {
        int[] s = arr.clone();
        Arrays.sort(s);
        List<Integer> uniqueList = new ArrayList<>();
        for (int x : s) {
            if (uniqueList.isEmpty() || uniqueList.get(uniqueList.size() - 1) != x) {
                uniqueList.add(x);
            }
        }
        int[] unique = uniqueList.stream().mapToInt(i -> i).toArray();
        for (int i = 0; i < arr.length; i++) {
            arr[i] = bisectLeft(unique, arr[i]) + 1;
        }
        return arr;
    }
    
    private int bisectLeft(int[] a, int x) {
        int lo = 0, hi = a.length;
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (a[mid] < x) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
}
