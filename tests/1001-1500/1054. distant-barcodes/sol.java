class Solution {
    public int[] rearrangeBarcodes(int[] barcodes) {
        Map<Integer, Integer> h = new HashMap<>();
        for (int i : barcodes) {
            h.put(i, h.getOrDefault(i, 0) + 1);
        }
        PriorityQueue<int[]> heap = new PriorityQueue<>((a, b) -> a[0] - b[0]);
        for (Map.Entry<Integer, Integer> entry : h.entrySet()) {
            heap.offer(new int[]{-entry.getValue(), entry.getKey()});
        }
        List<Integer> l = new ArrayList<>();
        while (heap.size() > 1) {
            int[] x = heap.poll();
            int[] y = heap.poll();
            l.add(x[1]);
            l.add(y[1]);
            x[0]++;
            y[0]++;
            if (x[0] != 0) {
                heap.offer(x);
            }
            if (y[0] != 0) {
                heap.offer(y);
            }
        }
        if (!heap.isEmpty()) {
            l.add(heap.poll()[1]);
        }
        int[] result = new int[l.size()];
        for (int i = 0; i < l.size(); i++) {
            result[i] = l.get(i);
        }
        return result;
    }
}
