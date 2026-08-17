class Solution {
  String removeOccurrences(String s, String part) {
    List<String> result_stack = [];
    int target_length = part.length;
    String target_end_char = part[target_length - 1];

    for (String current_char in s.split('')) {
      result_stack.add(current_char);

      if (current_char == target_end_char && result_stack.length >= target_length) {
        if (result_stack.sublist(result_stack.length - target_length).join() == part) {
          result_stack.removeRange(result_stack.length - target_length, result_stack.length);
        }
      }
    }

    return result_stack.join();
  }
}
