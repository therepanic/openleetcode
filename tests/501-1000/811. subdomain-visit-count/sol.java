class Solution {
    public List<String> subdomainVisits(String[] cpdomains) {
        Map<String, Integer> freq = new HashMap<>();
        for (String entry : cpdomains) {
            String[] split = entry.split(" ");
            int cnt = Integer.parseInt(split[0]);
            String dom = split[1];
            String[] parts = dom.split("\\.");
            for (int i = 0; i < parts.length; i++) {
                String sub = String.join(".", Arrays.copyOfRange(parts, i, parts.length));
                freq.put(sub, freq.getOrDefault(sub, 0) + cnt);
            }
        }
        List<String> result = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : freq.entrySet()) {
            result.add(entry.getValue() + " " + entry.getKey());
        }
        return result;
    }
}
