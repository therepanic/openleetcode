class Solution {
  int minOperations(List<String> logs) {
    int output = 0;
    for (String log in logs) {
      if (log == "../") {
        output--;
        if (output < 0) output = 0;
      } else if (log == "./") {
        continue;
      } else {
        output++;
      }
    }
    return output < 0 ? 0 : output;
  }
}
