class Solution {
public:
    string entityParser(string text) {
        unordered_map<string, string> entities = {
            {"&quot", "\""},
            {"&apos", "'"},
            {"&amp", "&"},
            {"&gt", ">"},
            {"&lt", "<"},
            {"&frasl", "/"}
        };
        string result;
        size_t i = 0;
        while (i < text.size()) {
            if (text[i] != '&') {
                result += text[i++];
                continue;
            }

            size_t end = i + 1;
            while (end < text.size() && text[end] != ';' &&
                   text[end] != '&' &&
                   !isspace(static_cast<unsigned char>(text[end]))) {
                ++end;
            }
            if (end < text.size() && text[end] == ';') {
                string entity = text.substr(i, end - i);
                auto it = entities.find(entity);
                if (it != entities.end()) {
                    result += it->second;
                } else {
                    result.append(text, i, end - i + 1);
                }
                i = end + 1;
            } else {
                result += '&';
                ++i;
            }
        }
        return result;
    }
};
