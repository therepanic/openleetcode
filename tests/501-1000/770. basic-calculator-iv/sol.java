class Solution {
    public List<String> basicCalculatorIV(String expression, String[] evalvars, int[] evalints) {
        Map<String, Integer> evalmap = new HashMap<>();
        for (int i = 0; i < evalvars.length; i++)
            evalmap.put(evalvars[i], evalints[i]);

        List<String> tokens = new ArrayList<>();
        StringBuilder buf = new StringBuilder();
        for (char ch : expression.toCharArray()) {
            if (Character.isLetterOrDigit(ch)) {
                buf.append(ch);
            } else {
                if (buf.length() > 0) { tokens.add(buf.toString()); buf.setLength(0); }
                if ("+-*()".indexOf(ch) >= 0) tokens.add(String.valueOf(ch));
            }
        }
        if (buf.length() > 0) tokens.add(buf.toString());

        Deque<Map<String, Integer>> vals = new ArrayDeque<>();
        Deque<String> ops = new ArrayDeque<>();
        Map<String, Integer> prec = Map.of("+", 1, "-", 1, "*", 2);

        for (String tok : tokens) {
            if (tok.equals("(")) ops.push(tok);
            else if (tok.equals(")")) {
                while (!ops.isEmpty() && !ops.peek().equals("(")) applyOp(vals, ops);
                ops.pop();
            } else if (prec.containsKey(tok)) {
                while (!ops.isEmpty() && !ops.peek().equals("(") &&
                       prec.getOrDefault(ops.peek(), 0) >= prec.get(tok))
                    applyOp(vals, ops);
                ops.push(tok);
            } else vals.push(parseToken(tok, evalmap));
        }
        while (!ops.isEmpty()) applyOp(vals, ops);
        Map<String, Integer> poly = vals.pop();

        List<String> ans = new ArrayList<>();
        List<Map.Entry<String, Integer>> entries = new ArrayList<>();
        for (var e : poly.entrySet()) if (e.getValue() != 0) entries.add(e);
        entries.sort((a, b) -> {
            String[] ka = a.getKey().isEmpty() ? new String[0] : a.getKey().split(",");
            String[] kb = b.getKey().isEmpty() ? new String[0] : b.getKey().split(",");
            if (ka.length != kb.length) return kb.length - ka.length;
            return String.join("*", ka).compareTo(String.join("*", kb));
        });
        for (var e : entries) {
            String[] vars = e.getKey().isEmpty() ? new String[0] : e.getKey().split(",");
            if (vars.length == 0) ans.add(String.valueOf(e.getValue()));
            else ans.add(e.getValue() + "*" + String.join("*", vars));
        }
        return ans;
    }

    private void applyOp(Deque<Map<String, Integer>> vals, Deque<String> ops) {
        String op = ops.pop();
        Map<String, Integer> b = vals.pop();
        Map<String, Integer> a = vals.pop();
        if (op.equals("+")) vals.push(add(a, b));
        else if (op.equals("-")) vals.push(sub(a, b));
        else vals.push(mul(a, b));
    }

    private String makeKey(String[] vars) {
        Arrays.sort(vars);
        return String.join(",", vars);
    }

    private Map<String, Integer> combine(Map<String, Integer> poly) {
        Map<String, Integer> res = new HashMap<>();
        for (var e : poly.entrySet())
            if (e.getValue() != 0) res.put(e.getKey(), e.getValue());
        return res;
    }

    private Map<String, Integer> add(Map<String, Integer> a, Map<String, Integer> b) {
        Map<String, Integer> res = new HashMap<>(a);
        for (var e : b.entrySet())
            res.merge(e.getKey(), e.getValue(), Integer::sum);
        return combine(res);
    }

    private Map<String, Integer> sub(Map<String, Integer> a, Map<String, Integer> b) {
        Map<String, Integer> res = new HashMap<>(a);
        for (var e : b.entrySet())
            res.merge(e.getKey(), -e.getValue(), Integer::sum);
        return combine(res);
    }

    private Map<String, Integer> mul(Map<String, Integer> a, Map<String, Integer> b) {
        Map<String, Integer> res = new HashMap<>();
        for (var ea : a.entrySet()) {
            String[] va = ea.getKey().isEmpty() ? new String[0] : ea.getKey().split(",");
            for (var eb : b.entrySet()) {
                String[] vb = eb.getKey().isEmpty() ? new String[0] : eb.getKey().split(",");
                String[] merged = new String[va.length + vb.length];
                System.arraycopy(va, 0, merged, 0, va.length);
                System.arraycopy(vb, 0, merged, va.length, vb.length);
                String key = makeKey(merged);
                res.merge(key, ea.getValue() * eb.getValue(), Integer::sum);
            }
        }
        return combine(res);
    }

    private Map<String, Integer> parseToken(String tok, Map<String, Integer> evalmap) {
        Map<String, Integer> res = new HashMap<>();
        try {
            int n = Integer.parseInt(tok);
            res.put("", n);
        } catch (NumberFormatException e) {
            if (evalmap.containsKey(tok)) res.put("", evalmap.get(tok));
            else res.put(tok, 1);
        }
        return res;
    }
}
