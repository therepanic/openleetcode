class Solution {
public:
    int minimumTeachings(int n, vector<vector<int>>& languages, vector<vector<int>>& friendships) {
        unordered_set<int> users_to_teach;
        
        for (auto& friendship : friendships) {
            int user1 = friendship[0] - 1;
            int user2 = friendship[1] - 1;
            bool can_communicate = false;
            for (int lang1 : languages[user1]) {
                for (int lang2 : languages[user2]) {
                    if (lang1 == lang2) {
                        can_communicate = true;
                        break;
                    }
                }
                if (can_communicate) break;
            }
            if (!can_communicate) {
                users_to_teach.insert(user1);
                users_to_teach.insert(user2);
            }
        }
        
        int min_users = languages.size() + 1;
        for (int language = 1; language <= n; language++) {
            int count = 0;
            for (int user : users_to_teach) {
                bool has_lang = false;
                for (int lang : languages[user]) {
                    if (lang == language) {
                        has_lang = true;
                        break;
                    }
                }
                if (!has_lang) count++;
            }
            min_users = min(min_users, count);
        }
        return min_users;
    }
};
