class Solution {
    public java.util.List<java.util.List<String>> accountsMerge(String[][] accounts) {
        java.util.Map<String, String> parent = new java.util.HashMap<>();
        java.util.Map<String, String> owner = new java.util.HashMap<>();

        for (String[] account : accounts) {
            String name = account[0];
            String first = account[1];
            parent.putIfAbsent(first, first);
            owner.put(first, name);
            for (int i = 1; i < account.length; i++) {
                String email = account[i];
                parent.putIfAbsent(email, email);
                owner.put(email, name);
                union(parent, first, email);
            }
        }

        java.util.Map<String, java.util.List<String>> groups = new java.util.HashMap<>();
        for (String email : owner.keySet()) {
            String root = find(parent, email);
            groups.computeIfAbsent(root, k -> new java.util.ArrayList<>()).add(email);
        }

        java.util.List<java.util.List<String>> result = new java.util.ArrayList<>();
        for (java.util.Map.Entry<String, java.util.List<String>> entry : groups.entrySet()) {
            java.util.List<String> emails = entry.getValue();
            java.util.Collections.sort(emails);
            java.util.List<String> merged = new java.util.ArrayList<>();
            merged.add(owner.get(entry.getKey()));
            merged.addAll(emails);
            result.add(merged);
        }
        return result;
    }

    private String find(java.util.Map<String, String> parent, String x) {
        String p = parent.get(x);
        if (!p.equals(x)) {
            parent.put(x, find(parent, p));
        }
        return parent.get(x);
    }

    private void union(java.util.Map<String, String> parent, String a, String b) {
        String ra = find(parent, a);
        String rb = find(parent, b);
        if (!ra.equals(rb)) {
            parent.put(rb, ra);
        }
    }
}
