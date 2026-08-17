class Solution {
  int minimumTeachings(int n, List<List<int>> languages, List<List<int>> friendships) {
    Set<int> usersToTeach = {};
    
    for (var friendship in friendships) {
      int user1 = friendship[0] - 1;
      int user2 = friendship[1] - 1;
      bool canCommunicate = false;
      for (int lang1 in languages[user1]) {
        for (int lang2 in languages[user2]) {
          if (lang1 == lang2) {
            canCommunicate = true;
            break;
          }
        }
        if (canCommunicate) break;
      }
      if (!canCommunicate) {
        usersToTeach.add(user1);
        usersToTeach.add(user2);
      }
    }
    
    int minUsers = languages.length + 1;
    for (int language = 1; language <= n; language++) {
      int count = 0;
      for (int user in usersToTeach) {
        bool hasLang = languages[user].contains(language);
        if (!hasLang) count++;
      }
      minUsers = count < minUsers ? count : minUsers;
    }
    return minUsers;
  }
}
