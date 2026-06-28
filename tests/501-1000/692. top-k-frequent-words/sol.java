class Solution {
    public List<String> topKFrequent(String[] words, int k) {
        Map<String, Integer> counter = new HashMap<>();
        for (String w : words) {
            counter.put(w, counter.getOrDefault(w, 0) + 1);
        }
        PriorityQueue<Pair<Integer, String>> heap = new PriorityQueue<>(
            (a, b) -> !a.getKey().equals(b.getKey()) ? a.getKey() - b.getKey() : a.getValue().compareTo(b.getValue())
        );
        for (Map.Entry<String, Integer> e : counter.entrySet()) {
            heap.offer(new Pair<>(-e.getValue(), e.getKey()));
        }
        List<String> ans = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            ans.add(heap.poll().getValue());
        }
        return ans;
    }
}
