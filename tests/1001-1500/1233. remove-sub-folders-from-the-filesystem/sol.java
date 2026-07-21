class Solution {
    public List<String> removeSubfolders(String[] folder) {
        Arrays.sort(folder);
        List<String> res = new ArrayList<>();
        for (String f : folder) {
            if (res.isEmpty()) {
                res.add(f);
            } else {
                String prev = res.get(res.size() - 1);
                if (f.startsWith(prev) && f.length() > prev.length() && f.charAt(prev.length()) == '/') {
                    continue;
                } else {
                    res.add(f);
                }
            }
        }
        return res;
    }
}
