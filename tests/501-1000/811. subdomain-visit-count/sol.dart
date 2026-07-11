class Solution {
  List<String> subdomainVisits(List<String> cpdomains) {
    Map<String, int> freq = {};
    for (var entry in cpdomains) {
      var parts = entry.split(' ');
      int cnt = int.parse(parts[0]);
      var dom = parts[1];
      var subParts = dom.split('.');
      for (int i = 0; i < subParts.length; i++) {
        var sub = subParts.sublist(i).join('.');
        freq[sub] = (freq[sub] ?? 0) + cnt;
      }
    }
    return freq.entries.map((e) => '${e.value} ${e.key}').toList();
  }
}
