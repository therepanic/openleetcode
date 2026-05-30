using _JSON_ = nlohmann::json;

template<typename T> T& lv(T&& x) { return x; }

struct _TEST_ {
    _JSON_ val;
};

inline void from_json(const _JSON_& j, _TEST_& t) {
    j.at("val").get_to(t.val);
}

inline char jsonToChar(const _JSON_& j) { return j.get<string>()[0]; }
inline int jsonToInt(const _JSON_& j) { return j.get<int>(); }
inline long long jsonToLong(const _JSON_& j) { return j.get<long long>(); }
inline double jsonToDouble(const _JSON_& j) { return j.get<double>(); }
inline float jsonToFloat(const _JSON_& j) { return j.get<float>(); }
inline bool jsonToBool(const _JSON_& j) { return j.get<bool>(); }
inline string jsonToString(const _JSON_& j) {
  return j.is_string() ? j.get<string>() : j.dump();
}

inline vector<int> jsonToIntArray(const _JSON_& j) {
  return j.get<vector<int> >();
}

inline vector<long long> jsonToLongArray(const _JSON_& j) {
  return j.get<vector<long long> >();
}

inline vector<double> jsonToDoubleArray(const _JSON_& j) {
  return j.get<vector<double> >();
}

inline vector<float> jsonToFloatArray(const _JSON_& j) {
  return j.get<vector<float> >();
}

inline vector<bool> jsonToBoolArray(const _JSON_& j) {
  return j.get<vector<bool> >();
}

inline vector<string> jsonToStringArray(const _JSON_& j) {
  return j.get<vector<string> >();
}

inline vector<optional<int>> jsonToOptionalIntArray(const _JSON_& j) {
  vector<optional<int>> out;
  out.reserve(j.size());
  for (const auto& x : j) {
    if (x.is_null()) {
      out.push_back(nullopt);
    } else {
      out.push_back(x.get<int>());
    }
  }
  return out;
}

inline vector<char> jsonToCharArray(const _JSON_& j) {
  vector<char> out;
  out.reserve(j.size());
  for (const auto& x : j) out.push_back(jsonToChar(x));
  return out;
}

inline vector<vector<int>> jsonToIntMatrix(const _JSON_& j) {
  return j.get<vector<vector<int> > >();
}

inline vector<vector<long long>> jsonToLongMatrix(const _JSON_& j) {
  return j.get<vector<vector<long long> > >();
}

inline vector<vector<double>> jsonToDoubleMatrix(const _JSON_& j) {
  return j.get<vector<vector<double> > >();
}

inline vector<vector<float>> jsonToFloatMatrix(const _JSON_& j) {
  return j.get<vector<vector<float> > >();
}

inline vector<vector<bool>> jsonToBoolMatrix(const _JSON_& j) {
  return j.get<vector<vector<bool> > >();
}

inline vector<vector<string>> jsonToStringMatrix(const _JSON_& j) {
  return j.get<vector<vector<string> > >();
}

inline vector<vector<char>> jsonToCharMatrix(const _JSON_& j) {
  vector<vector<char>> out;
  out.reserve(j.size());
  for (const auto& row : j) out.push_back(jsonToCharArray(row));
  return out;
}

struct ListNode {
  int val;
  ListNode *next;
  ListNode() : val(0), next(nullptr) {}
  ListNode(int x) : val(x), next(nullptr) {}
  ListNode(int x, ListNode *next) : val(x), next(next) {}
};

struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
  TreeNode() : val(0), left(nullptr), right(nullptr) {}
  TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
  TreeNode(int x, TreeNode *left, TreeNode *right)
      : val(x), left(left), right(right) {}
};

inline ListNode *toListNode(const vector<int> &arr) {
  if (arr.empty())
    return nullptr;
  ListNode *head = new ListNode(arr[0]);
  ListNode *cur = head;
  for (int i = 1; i < (int)arr.size(); i++) {
    cur->next = new ListNode(arr[i]);
    cur = cur->next;
  }
  return head;
}

inline vector<int> listNodeToArray(ListNode *head) {
  vector<int> res;
  for (ListNode *cur = head; cur != nullptr; cur = cur->next)
    res.push_back(cur->val);
  return res;
}

inline vector<ListNode *> toLinkedLists(const vector<vector<int>> &arrs) {
  vector<ListNode *> res;
  res.reserve(arrs.size());
  for (const auto &arr : arrs)
    res.push_back(toListNode(arr));
  return res;
}

inline TreeNode *toTreeNode(const vector<optional<int>> &arr) {
  if (arr.empty() || !arr[0])
    return nullptr;
  TreeNode *root = new TreeNode(*arr[0]);
  queue<TreeNode *> q;
  q.push(root);
  int i = 1;
  while (!q.empty() && i < (int)arr.size()) {
    TreeNode *node = q.front();
    q.pop();
    if (i < (int)arr.size() && arr[i]) {
      node->left = new TreeNode(*arr[i]);
      q.push(node->left);
    }
    i++;
    if (i < (int)arr.size() && arr[i]) {
      node->right = new TreeNode(*arr[i]);
      q.push(node->right);
    }
    i++;
  }
  return root;
}

inline vector<optional<int>> treeNodeToArray(TreeNode *root) {
  vector<optional<int>> res;
  if (!root)
    return res;
  queue<TreeNode *> q;
  q.push(root);
  while (!q.empty()) {
    TreeNode *node = q.front();
    q.pop();
    if (node) {
      res.push_back(node->val);
      q.push(node->left);
      q.push(node->right);
    } else {
      res.push_back(nullopt);
    }
  }
  while (!res.empty() && !res.back())
    res.pop_back();
  return res;
}

inline vector<vector<optional<int>>> treeNodesArrayToVector(const vector<TreeNode *> &roots) {
  vector<vector<optional<int>>> res;
  res.reserve(roots.size());
  for (auto *root : roots) {
    res.push_back(treeNodeToArray(root));
  }
  return res;
}

inline string _jsonQuote(const string &s) {
  string r;
  r.reserve(s.size() + 2);
  r += '"';
  for (unsigned char c : s) {
    switch (c) {
    case '"':
      r += "\\\"";
      break;
    case '\\':
      r += "\\\\";
      break;
    case '\b':
      r += "\\b";
      break;
    case '\f':
      r += "\\f";
      break;
    case '\n':
      r += "\\n";
      break;
    case '\r':
      r += "\\r";
      break;
    case '\t':
      r += "\\t";
      break;
    default:
      if (c < 0x20) {
        char buf[8];
        snprintf(buf, sizeof(buf), "\\u%04x", c);
        r += buf;
      } else {
        r += (char)c;
      }
    }
  }
  r += '"';
  return r;
}

inline string toJson(bool v) { return v ? "true" : "false"; }
inline string toJson(int v) { return to_string(v); }
inline string toJson(long v) { return to_string(v); }
inline string toJson(long long v) { return to_string(v); }
inline string toJson(unsigned v) { return to_string(v); }
inline string toJson(unsigned long v) { return to_string(v); }
inline string toJson(unsigned long long v) { return to_string(v); }
inline string toJson(double v) {
  if (isnan(v) || isinf(v)) return "null";
  ostringstream oss;
  oss << setprecision(15) << v;
  string s = oss.str();
  if (s.find_first_of(".eE") == string::npos) s += ".0";
  return s;
}
inline string toJson(float v) { return toJson((double)v); }
inline string toJson(char v) { return _jsonQuote(string(1, v)); }
inline string toJson(const string &v) { return _jsonQuote(v); }
inline string toJson(const char *v) { return _jsonQuote(string(v)); }
inline string toJson(nullptr_t) { return "null"; }
inline string toJson(const optional<int> &v) {
  return v ? to_string(*v) : "null";
}

template <typename T> string toJson(const vector<T> &v) {
  string r = "[";
  for (int i = 0; i < (int)v.size(); i++) {
    if (i)
      r += ',';
    r += toJson(v[i]);
  }
  r += ']';
  return r;
}

inline string toJson(ListNode *head) { return toJson(listNodeToArray(head)); }
inline string toJson(TreeNode *root) { return toJson(treeNodeToArray(root)); }
