class Solution {
  bool wordPattern(String pattern, String s) {
    List<String> words = s.split(" ");
    if (pattern.length != words.length) return false;
    
    return pattern.split('').toSet().length == words.toSet().length &&
           pattern.split('').toSet().length == 
           List.generate(pattern.length, (i) => '${pattern[i]},${words[i]}').toSet().length;
  }
}
