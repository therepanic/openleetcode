class Solution {
  String maskPII(String s) {
    if (s.contains("@")) {
      var parts = s.split("@");
      var name = parts[0].toLowerCase();
      var domain = parts[1].toLowerCase();
      name = name[0] + "*****" + name[name.length - 1];
      return name + "@" + domain;
    } else {
      var gg = "";
      for (var x in s.split('')) {
        if (int.tryParse(x) != null) {
          gg += x;
        }
      }
      var l = gg.length;
      if (l > 10) {
        return "+" + "*" * (l - 10) + "-***-***-" + gg.substring(l - 4);
      }
      return "***-***-" + gg.substring(l - 4);
    }
  }
}
