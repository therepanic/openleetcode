class Solution {
  String entityParser(String text) {
    final entities = {
      "&quot": '"',
      "&apos": "'",
      "&amp": "&",
      "&gt": ">",
      "&lt": "<",
      "&frasl": "/"
    };
    
    final pattern = RegExp(r'&[^;&\s]+;');
    
    return text.replaceAllMapped(pattern, (match) {
      final matched = match.group(0)!;
      final entity = matched.substring(0, matched.length - 1);
      return entities.containsKey(entity) ? entities[entity]! : matched;
    });
  }
}
