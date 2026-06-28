class Solution {
    public List<List<String>> findDuplicate(String[] paths) {
        Map<String, List<String>> map = new HashMap<>();
        for (String path : paths) {
            String[] parts = path.split(" ");
            String directory = parts[0];
            for (int i = 1; i < parts.length; i++) {
                String file = parts[i];
                int parenIndex = file.indexOf('(');
                String name = file.substring(0, parenIndex);
                String content = file.substring(parenIndex + 1, file.length() - 1);
                String fullPath = directory + "/" + name;
                map.computeIfAbsent(content, k -> new ArrayList<>()).add(fullPath);
            }
        }
        List<List<String>> result = new ArrayList<>();
        for (List<String> group : map.values()) {
            if (group.size() > 1) {
                result.add(group);
            }
        }
        return result;
    }
}
