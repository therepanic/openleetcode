public class ListNode {
    public int val;
    public ListNode next;
    public ListNode(int val = 0, ListNode next = null) {
        this.val = val;
        this.next = next;
    }

    public static ListNode ToListNode(int[] arr) {
        if (arr.Length == 0) return null;
        var head = new ListNode(arr[0]);
        var cur = head;
        for (int i = 1; i < arr.Length; i++) {
            cur.next = new ListNode(arr[i]);
            cur = cur.next;
        }
        return head;
    }

    public static int[] ListNodeToArray(ListNode head) {
        var res = new List<int>();
        for (var cur = head; cur != null; cur = cur.next)
            res.Add(cur.val);
        return res.ToArray();
    }

    public static ListNode[] ToListNodes(int[][] arrs) {
        return arrs.Select(ToListNode).ToArray();
    }
}

public class TreeNode {
    public int val;
    public TreeNode left;
    public TreeNode right;
    public TreeNode(int val = 0, TreeNode left = null, TreeNode right = null) {
        this.val = val;
        this.left = left;
        this.right = right;
    }

    public static TreeNode ToTreeNode(int?[] arr) {
        if (arr.Length == 0 || arr[0] == null) return null;
        var root = new TreeNode(arr[0].Value);
        var queue = new Queue<TreeNode>();
        queue.Enqueue(root);
        int i = 1;
        while (queue.Count > 0 && i < arr.Length) {
            var node = queue.Dequeue();
            if (i < arr.Length && arr[i] != null) {
                node.left = new TreeNode(arr[i].Value);
                queue.Enqueue(node.left);
            }
            i++;
            if (i < arr.Length && arr[i] != null) {
                node.right = new TreeNode(arr[i].Value);
                queue.Enqueue(node.right);
            }
            i++;
        }
        return root;
    }

    public static int?[] TreeNodeToArray(TreeNode root) {
        var res = new List<int?>();
        if (root == null) return res.ToArray();
        var queue = new Queue<TreeNode>();
        queue.Enqueue(root);
        while (queue.Count > 0) {
            var node = queue.Dequeue();
            if (node != null) {
                res.Add(node.val);
                queue.Enqueue(node.left);
                queue.Enqueue(node.right);
            } else {
                res.Add(null);
            }
        }
        while (res.Count > 0 && res[res.Count - 1] == null)
            res.RemoveAt(res.Count - 1);
        return res.ToArray();
    }

    public static List<int?[]> TreeNodeListToArrayList(IList<TreeNode> roots) {
        return roots.Select(TreeNodeToArray).ToList();
    }
}

partial class _Runner {
    static int ToInt(JToken el) {
        return el == null || el.Type == JTokenType.Null ? 0 : el.Value<int>();
    }

    static long ToLong(JToken el) {
        return el == null || el.Type == JTokenType.Null ? 0L : el.Value<long>();
    }

    static double ToDouble(JToken el) {
        return el == null || el.Type == JTokenType.Null ? 0d : el.Value<double>();
    }

    static float ToFloat(JToken el) {
        return el == null || el.Type == JTokenType.Null ? 0f : el.Value<float>();
    }

    static string ToStringValue(JToken el) {
        return el == null || el.Type == JTokenType.Null ? "" : el.Type == JTokenType.String ? el.Value<string>() : el.ToString();
    }

    static char ToChar(JToken el) {
        var s = ToStringValue(el);
        return s.Length == 0 ? '\0' : s[0];
    }

    static bool ToBool(JToken el) {
        if (el == null || el.Type == JTokenType.Null) return false;
        if (el.Type == JTokenType.Boolean) return el.Value<bool>();
        return bool.TryParse(el.ToString(), out var value) && value;
    }

    static int[] ToIntArray(JToken el) {
        return ((JArray)el).Select(ToInt).ToArray();
    }

    static long[] ToLongArray(JToken el) {
        return ((JArray)el).Select(ToLong).ToArray();
    }

    static double[] ToDoubleArray(JToken el) {
        return ((JArray)el).Select(ToDouble).ToArray();
    }

    static float[] ToFloatArray(JToken el) {
        return ((JArray)el).Select(ToFloat).ToArray();
    }

    static bool[] ToBoolArray(JToken el) {
        return ((JArray)el).Select(ToBool).ToArray();
    }

    static string[] ToStringArray(JToken el) {
        return ((JArray)el).Select(ToStringValue).ToArray();
    }

    static int?[] ToNullableIntArray(JToken el) {
        return ((JArray)el).Select(x => x == null || x.Type == JTokenType.Null ? (int?)null : ToInt(x)).ToArray();
    }

    static int[][] ToIntMatrix(JToken el) {
        return ((JArray)el).Select(ToIntArray).ToArray();
    }

    static long[][] ToLongMatrix(JToken el) {
        return ((JArray)el).Select(ToLongArray).ToArray();
    }

    static double[][] ToDoubleMatrix(JToken el) {
        return ((JArray)el).Select(ToDoubleArray).ToArray();
    }

    static float[][] ToFloatMatrix(JToken el) {
        return ((JArray)el).Select(ToFloatArray).ToArray();
    }

    static bool[][] ToBoolMatrix(JToken el) {
        return ((JArray)el).Select(ToBoolArray).ToArray();
    }

    static string[][] ToStringMatrix(JToken el) {
        return ((JArray)el).Select(ToStringArray).ToArray();
    }

    static char[] ToCharArray(JToken el) {
        return ((JArray)el).Select(ToChar).ToArray();
    }

    static char[][] ToCharMatrix(JToken el) {
        return ((JArray)el).Select(ToCharArray).ToArray();
    }

    static string ToJson(object obj) {
        if (obj == null) return "null";
        if (obj is bool b) return b ? "true" : "false";
        if (obj is int iv) return iv.ToString();
        if (obj is long lv) return lv.ToString();
        if (obj is uint uiv) return uiv.ToString();
        if (obj is ulong ulv) return ulv.ToString();
        if (obj is short sv) return sv.ToString();
        if (obj is ushort usv) return usv.ToString();
        if (obj is byte bv) return bv.ToString();
        if (obj is sbyte sbv) return sbv.ToString();
        if (obj is double dv) return dv.ToString(System.Globalization.CultureInfo.InvariantCulture);
        if (obj is float fv) return fv.ToString(System.Globalization.CultureInfo.InvariantCulture);
        if (obj is decimal decv) return decv.ToString(System.Globalization.CultureInfo.InvariantCulture);
        if (obj is string str) return QuoteJsonString(str);
        if (obj is char cv) return QuoteJsonString(cv.ToString());
        if (obj is ListNode ln) return ToJson(ListNode.ListNodeToArray(ln));
        if (obj is TreeNode tn) return ToJson(TreeNode.TreeNodeToArray(tn));
        if (obj is System.Collections.IDictionary dict) {
            var parts = new List<string>();
            foreach (System.Collections.DictionaryEntry e in dict)
                parts.Add(QuoteJsonString(e.Key.ToString()) + ":" + ToJson(e.Value));
            return "{" + string.Join(",", parts) + "}";
        }
        if (obj is System.Collections.IEnumerable en) {
            var parts = new List<string>();
            foreach (var item in en) parts.Add(ToJson(item));
            return "[" + string.Join(",", parts) + "]";
        }
        return QuoteJsonString(obj.ToString());
    }

    static string QuoteJsonString(string s) {
        var sb = new System.Text.StringBuilder(s.Length + 8);
        sb.Append('"');
        for (int i = 0; i < s.Length; i++) {
            char ch = s[i];
            switch (ch) {
                case '"': sb.Append("\\\""); break;
                case '\\': sb.Append("\\\\"); break;
                case '\b': sb.Append("\\b"); break;
                case '\f': sb.Append("\\f"); break;
                case '\n': sb.Append("\\n"); break;
                case '\r': sb.Append("\\r"); break;
                case '\t': sb.Append("\\t"); break;
                default:
                    if (ch < 0x20)
                        sb.Append("\\u").Append(((int)ch).ToString("x4"));
                    else
                        sb.Append(ch);
                    break;
            }
        }
        sb.Append('"');
        return sb.ToString();
    }
}
