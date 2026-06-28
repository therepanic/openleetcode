class Solution {
public:
    bool isValid(string code) {
        regex tag_pat(R"(^<(/?)([A-Z]{1,9})>$)");
        string open_cdata = "<![CDATA[";
        string close_cdata = "]]>";
        vector<string> stack;
        bool first_tag_seen = false;
        int i = 0;
        int j = code.length();
        
        while (i <= j) {
            size_t s = code.find('<', i);
            if (s == string::npos) break;
            size_t e = code.find('>', s + 1);
            if (e == string::npos) return false;
            
            string candidate = code.substr(s, e - s + 1);
            smatch m;
            
            if (regex_match(candidate, m, tag_pat)) {
                string tag = m[2].str();
                string slash = m[1].str();
                
                if (slash.empty()) {
                    if (!first_tag_seen && s != 0) return false;
                    stack.push_back(tag);
                    first_tag_seen = true;
                } else {
                    if (stack.empty() || stack.back() != tag) return false;
                    if (stack.size() == 1 && e != code.length() - 1) return false;
                    stack.pop_back();
                }
                
                i = e + 1;
            } else if (code.substr(s, open_cdata.length()) == open_cdata) {
                size_t k = code.find(close_cdata, s + open_cdata.length());
                if (k == string::npos) return false;
                i = k + close_cdata.length();
            } else {
                return false;
            }
        }
        
        return stack.empty() && first_tag_seen;
    }
};
