class Solution {
    public List<String> braceExpansionII(String expression) {
        Deque<List<String>> stack = new ArrayDeque<>();
        List<String> res = new ArrayList<>();
        List<String> cur = new ArrayList<>();
        for (int i = 0; i < expression.length(); i++) {
            char v = expression.charAt(i);
            if (Character.isLetter(v)) {
                if (cur.isEmpty()) {
                    cur = new ArrayList<>();
                    cur.add(String.valueOf(v));
                } else {
                    List<String> next = new ArrayList<>();
                    for (String c : cur) {
                        next.add(c + v);
                    }
                    cur = next;
                }
            } else if (v == '{') {
                stack.push(res);
                stack.push(new ArrayList<>(cur));
                res = new ArrayList<>();
                cur = new ArrayList<>();
            } else if (v == '}') {
                List<String> pre = stack.pop();
                List<String> preRes = stack.pop();
                List<String> merged = new ArrayList<>(res);
                merged.addAll(cur);
                List<String> next = new ArrayList<>();
                if (pre.isEmpty()) {
                    next = merged;
                } else {
                    for (String p : pre) {
                        for (String c : merged) {
                            next.add(p + c);
                        }
                    }
                }
                cur = next;
                res = preRes;
            } else if (v == ',') {
                res.addAll(cur);
                cur = new ArrayList<>();
            }
        }
        res.addAll(cur);
        Set<String> set = new HashSet<>(res);
        List<String> result = new ArrayList<>(set);
        Collections.sort(result);
        return result;
    }
}
