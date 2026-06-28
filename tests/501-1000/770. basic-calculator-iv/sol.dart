class Solution {
  List<String> basicCalculatorIV(String expression, List<String> evalvars, List<int> evalints) {
    Map<String, int> evalmap = {};
    for (int i = 0; i < evalvars.length; i++) {
      evalmap[evalvars[i]] = evalints[i];
    }

    List<String> tokens = [];
    String buf = '';
    for (var ch in expression.split('')) {
      if (RegExp(r'[a-zA-Z0-9]').hasMatch(ch)) {
        buf += ch;
      } else {
        if (buf.isNotEmpty) { tokens.add(buf); buf = ''; }
        if ('+-*()'.contains(ch)) tokens.add(ch);
      }
    }
    if (buf.isNotEmpty) tokens.add(buf);

    List<Map<String, int>> vals = [];
    List<String> ops = [];
    Map<String, int> prec = {'+': 1, '-': 1, '*': 2};

    void applyOp() {
      String op = ops.removeLast();
      var b = vals.removeLast();
      var a = vals.removeLast();
      if (op == '+') vals.add(add(a, b));
      else if (op == '-') vals.add(sub(a, b));
      else vals.add(mul(a, b));
    }

    for (var tok in tokens) {
      if (tok == '(') {
        ops.add(tok);
      } else if (tok == ')') {
        while (ops.isNotEmpty && ops.last != '(') applyOp();
        ops.removeLast();
      } else if (prec.containsKey(tok)) {
        while (ops.isNotEmpty && ops.last != '(' && prec[ops.last]! >= prec[tok]!) applyOp();
        ops.add(tok);
      } else {
        vals.add(parseToken(tok, evalmap));
      }
    }
    while (ops.isNotEmpty) applyOp();
    var poly = vals.last;

    List<MapEntry<String, int>> items = [];
    for (var e in poly.entries) {
      if (e.value != 0) items.add(e);
    }
    items.sort((a, b) {
      List<String> va = a.key.isEmpty ? [] : a.key.split(',');
      List<String> vb = b.key.isEmpty ? [] : b.key.split(',');
      int cmp = vb.length.compareTo(va.length);
      if (cmp != 0) return cmp;
      return va.join('*').compareTo(vb.join('*'));
    });

    List<String> ans = [];
    for (var item in items) {
      List<String> vars = item.key.isEmpty ? [] : item.key.split(',');
      if (vars.isEmpty) {
        ans.add(item.value.toString());
      } else {
        ans.add('${item.value}*${vars.join('*')}');
      }
    }
    return ans;
  }

  String makeKey(List<String> vars) {
    vars.sort();
    return vars.join(',');
  }

  Map<String, int> combine(Map<String, int> poly) {
    Map<String, int> res = {};
    for (var e in poly.entries) {
      if (e.value != 0) res[e.key] = e.value;
    }
    return res;
  }

  Map<String, int> add(Map<String, int> a, Map<String, int> b) {
    Map<String, int> res = Map.from(a);
    for (var e in b.entries) {
      res[e.key] = (res[e.key] ?? 0) + e.value;
    }
    return combine(res);
  }

  Map<String, int> sub(Map<String, int> a, Map<String, int> b) {
    Map<String, int> res = Map.from(a);
    for (var e in b.entries) {
      res[e.key] = (res[e.key] ?? 0) - e.value;
    }
    return combine(res);
  }

  Map<String, int> mul(Map<String, int> a, Map<String, int> b) {
    Map<String, int> res = {};
    for (var ea in a.entries) {
      List<String> va = ea.key.isEmpty ? [] : ea.key.split(',');
      for (var eb in b.entries) {
        List<String> vb = eb.key.isEmpty ? [] : eb.key.split(',');
        List<String> merged = [...va, ...vb];
        String key = makeKey(merged);
        res[key] = (res[key] ?? 0) + ea.value * eb.value;
      }
    }
    return combine(res);
  }

  Map<String, int> parseToken(String tok, Map<String, int> evalmap) {
    Map<String, int> res = {};
    int? n = int.tryParse(tok);
    if (n != null) {
      res[''] = n;
    } else if (evalmap.containsKey(tok)) {
      res[''] = evalmap[tok]!;
    } else {
      res[tok] = 1;
    }
    return res;
  }
}
