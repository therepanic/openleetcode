class Solution {
  List<List<String>> suggestedProducts(List<String> products, String searchWord) {
    products.sort();
    var root = <String, List<dynamic>>{};
    
    // Insert each product into the Trie and store top 3 suggestions
    for (var product in products) {
      var node = root;
      for (var i = 0; i < product.length; i++) {
        var ch = product[i];
        if (!node.containsKey(ch)) {
          node[ch] = [<String, List<dynamic>>{}, <String>[]];
        }
        var pair = node[ch]!;
        var suggestions = pair[1] as List<String>;
        if (suggestions.length < 3) {
          suggestions.add(product);
        }
        node = pair[0] as Map<String, List<dynamic>>;
      }
    }
    
    // Search each character of searchWord in the Trie
    var result = <List<String>>[];
    Map<String, List<dynamic>>? node = root;
    for (var i = 0; i < searchWord.length; i++) {
      var ch = searchWord[i];
      if (node != null && node.containsKey(ch)) {
        var pair = node[ch]!;
        result.add(List<String>.from(pair[1] as List<String>));
        node = pair[0] as Map<String, List<dynamic>>;
      } else {
        node = null;
        result.add([]);
      }
    }
    
    return result;
  }
}
