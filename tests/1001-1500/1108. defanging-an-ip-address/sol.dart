class Solution {
  String defangIPaddr(String address) {
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < address.length; i++) {
      if (address[i] == '.') {
        buffer.write('[.]');
      } else {
        buffer.write(address[i]);
      }
    }
    return buffer.toString();
  }
}
