class Solution {
    public List<String> alertNames(String[] keyName, String[] keyTime) {
        Map<String, List<Integer>> map = new HashMap<>();
        
        for (int i = 0; i < keyName.length; i++) {
            String[] parts = keyTime[i].split(":");
            int minutes = Integer.parseInt(parts[0]) * 60 + Integer.parseInt(parts[1]);
            map.computeIfAbsent(keyName[i], k -> new ArrayList<>()).add(minutes);
        }
        
        List<String> result = new ArrayList<>();
        
        for (Map.Entry<String, List<Integer>> entry : map.entrySet()) {
            List<Integer> times = entry.getValue();
            Collections.sort(times);
            for (int i = 0; i < times.size() - 2; i++) {
                if (times.get(i+2) - times.get(i) <= 60) {
                    result.add(entry.getKey());
                    break;
                }
            }
        }
        
        Collections.sort(result);
        return result;
    }
}
