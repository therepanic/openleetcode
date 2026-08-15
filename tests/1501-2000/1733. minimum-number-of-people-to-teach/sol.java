import java.util.*;

class Solution {
    public int minimumTeachings(int n, int[][] languages, int[][] friendships) {
        Set<Integer> usersToTeach = new HashSet<>();
        
        for (int[] friendship : friendships) {
            int user1 = friendship[0] - 1;
            int user2 = friendship[1] - 1;
            boolean canCommunicate = false;
            for (int lang1 : languages[user1]) {
                for (int lang2 : languages[user2]) {
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
            for (int user : usersToTeach) {
                boolean hasLang = false;
                for (int lang : languages[user]) {
                    if (lang == language) {
                        hasLang = true;
                        break;
                    }
                }
                if (!hasLang) count++;
            }
            minUsers = Math.min(minUsers, count);
        }
        return minUsers;
    }
}
