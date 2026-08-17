public class Solution {
    public int MinimumTeachings(int n, int[][] languages, int[][] friendships) {
        var usersToTeach = new HashSet<int>();
        
        foreach (var friendship in friendships) {
            int user1 = friendship[0] - 1;
            int user2 = friendship[1] - 1;
            bool canCommunicate = false;
            foreach (int lang1 in languages[user1]) {
                foreach (int lang2 in languages[user2]) {
                    if (lang1 == lang2) {
                        canCommunicate = true;
                        break;
                    }
                }
                if (canCommunicate) break;
            }
            if (!canCommunicate) {
                usersToTeach.Add(user1);
                usersToTeach.Add(user2);
            }
        }
        
        int minUsers = languages.Length + 1;
        for (int language = 1; language <= n; language++) {
            int count = 0;
            foreach (int user in usersToTeach) {
                bool hasLang = false;
                foreach (int lang in languages[user]) {
                    if (lang == language) {
                        hasLang = true;
                        break;
                    }
                }
                if (!hasLang) count++;
            }
            minUsers = Math.Min(minUsers, count);
        }
        return minUsers;
    }
}
