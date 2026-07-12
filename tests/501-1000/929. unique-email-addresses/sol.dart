class Solution {
  int numUniqueEmails(List<String> emails) {
    Set<String> res = {};
    for (var email in emails) {
      var atIndex = email.indexOf('@');
      var local = email.substring(0, atIndex);
      var domain = email.substring(atIndex + 1);
      
      var plusIndex = local.indexOf('+');
      if (plusIndex != -1) {
        local = local.substring(0, plusIndex);
      }
      local = local.replaceAll('.', '');
      res.add(local + '@' + domain);
    }
    return res.length;
  }
}
