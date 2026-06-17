class Solution {
    public List<List<Integer>> getSkyline(int[][] buildings) {
        List<int[]> events = new ArrayList<>();
        for (int[] b : buildings) {
            int L = b[0], R = b[1], H = b[2];
            events.add(new int[]{L, -H});
            events.add(new int[]{R, H});
        }
        events.sort((a, b) -> {
            if (a[0] != b[0]) return a[0] - b[0];
            return a[1] - b[1];
        });
        
        List<List<Integer>> result = new ArrayList<>();
        PriorityQueue<Integer> liveBuildings = new PriorityQueue<>(Collections.reverseOrder());
        liveBuildings.offer(0);
        Map<Integer, Integer> pastBuildings = new HashMap<>();
        int prevMax = 0;
        
        for (int[] event : events) {
            int x = event[0], h = event[1];
            if (h < 0) {
                liveBuildings.offer(-h);
            } else {
                pastBuildings.put(h, pastBuildings.getOrDefault(h, 0) + 1);
            }
            
            while (!liveBuildings.isEmpty() && pastBuildings.containsKey(liveBuildings.peek())) {
                int top = liveBuildings.poll();
                pastBuildings.put(top, pastBuildings.get(top) - 1);
                if (pastBuildings.get(top) == 0) {
                    pastBuildings.remove(top);
                }
            }
            
            int currMax = liveBuildings.peek();
            if (currMax != prevMax) {
                result.add(Arrays.asList(x, currMax));
                prevMax = currMax;
            }
        }
        
        return result;
    }
}
