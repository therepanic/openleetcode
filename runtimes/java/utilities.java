class _TEST_ {
    public Object val;

    public _TEST_() {}
}

class TreeNode {
	public int val;
    public TreeNode left;
    public TreeNode right;

    public TreeNode() {}
    public TreeNode(int val) { this.val = val; }
    public TreeNode(int val, TreeNode left, TreeNode right) {
        this.val = val;
        this.left = left;
        this.right = right;
    }

    public static TreeNode toTreeNode(Integer[] arr) {
    if (arr == null || arr.length == 0 || arr[0] == null) return null;
    TreeNode root = new TreeNode(arr[0]);
    java.util.Queue<TreeNode> q = new java.util.LinkedList<>();
    q.add(root);
    int i = 1;
    while (!q.isEmpty() && i < arr.length) {
        TreeNode curr = q.poll();
        if (i < arr.length && arr[i] != null) {
            curr.left = new TreeNode(arr[i]);
            q.add(curr.left);
        }
        i++;
        if (i < arr.length && arr[i] != null) {
            curr.right = new TreeNode(arr[i]);
            q.add(curr.right);
        }
        i++;
    }
    return root;
}

    public static List<Integer> treeNodeToArray(TreeNode root) {
        List<Integer> res = new java.util.ArrayList<>();
        if (root == null) return res;
        java.util.Queue<TreeNode> q = new java.util.LinkedList<>();
        q.add(root);
        while (!q.isEmpty()) {
            TreeNode node = q.poll();
            if (node != null) {
                res.add(node.val);
                q.add(node.left);
                q.add(node.right);
            } else res.add(null);
        }
        while (!res.isEmpty() && res.get(res.size() - 1) == null) res.remove(res.size() - 1);
        return res;
    }

    public static List<List<Integer>> treeNodesArrayToArrayList(List<TreeNode> roots) {
        List<List<Integer>> res = new java.util.ArrayList<>(roots.size());
        for (TreeNode root : roots) {
            res.add(treeNodeToArray(root));
        }
        return res;
    }
}

class ListNode {
    public int val;
    public ListNode next;

    public ListNode() {}
    public ListNode(int val) { this.val = val; }
    public ListNode(int val, ListNode next) { this.val = val; this.next = next; }

    public static ListNode toListNode(int[] arr) {
        if (arr == null || arr.length == 0) return null;
        ListNode head = new ListNode(arr[0]);
        ListNode cur = head;
        for (int i = 1; i < arr.length; i++) {
            cur.next = new ListNode(arr[i]);
            cur = cur.next;
        }
        return head;
    }

    public static int[] listNodeToArray(ListNode head) {
        if (head == null) return new int[0];
        List<Integer> list = new ArrayList<>();
        ListNode cur = head;
        while (cur != null) {
            list.add(cur.val);
            cur = cur.next;
        }
        int[] result = new int[list.size()];
        for (int i = 0; i < result.length; i++) {
            result[i] = list.get(i);
        }
        return result;
    }

    public static ListNode[] toListNodes(int[][] arrs) {
        ListNode[] result = new ListNode[arrs.length];
        for (int i = 0; i < arrs.length; i++) {
            result[i] = toListNode(arrs[i]);
        }
        return result;
    }
}

final class Json {
    private static final Gson gson = new Gson();

    public static Map<String, Map<String, _TEST_>> fromJsonMap(String json) {
        return gson.fromJson(json, new TypeToken<Map<String, Map<String, _TEST_>>>() {}.getType());
    }

    public static String toJson(Object obj) {
        return gson.toJson(obj);
    }

    public static int toInt(Object obj) { return ((Number) obj).intValue(); }
    public static long toLong(Object obj) { return ((Number) obj).longValue(); }
    public static double toDouble(Object obj) { return ((Number) obj).doubleValue(); }
    public static float toFloat(Object obj) { return ((Number) obj).floatValue(); }
    public static boolean toBool(Object obj) { return (Boolean) obj; }
    public static String toStringValue(Object obj) { return String.valueOf(obj); }
    public static char toChar(Object obj) { return ((String) obj).charAt(0); }

    public static Integer[] toIntegerArray(Object obj) {
        return gson.fromJson(gson.toJsonTree(obj), Integer[].class);
    }

    public static int[] toIntArray(Object obj) {
        return gson.fromJson(gson.toJsonTree(obj), int[].class);
    }

    public static long[] toLongArray(Object obj) {
        return gson.fromJson(gson.toJsonTree(obj), long[].class);
    }

    public static double[] toDoubleArray(Object obj) {
        return gson.fromJson(gson.toJsonTree(obj), double[].class);
    }

    public static float[] toFloatArray(Object obj) {
        return gson.fromJson(gson.toJsonTree(obj), float[].class);
    }

    public static boolean[] toBoolArray(Object obj) {
        return gson.fromJson(gson.toJsonTree(obj), boolean[].class);
    }

    public static String[] toStringArray(Object obj) {
        return gson.fromJson(gson.toJsonTree(obj), String[].class);
    }

    public static long[][] toLongMatrix(Object obj) {
        return gson.fromJson(gson.toJsonTree(obj), long[][].class);
    }

    public static double[][] toDoubleMatrix(Object obj) {
        return gson.fromJson(gson.toJsonTree(obj), double[][].class);
    }

    public static float[][] toFloatMatrix(Object obj) {
        return gson.fromJson(gson.toJsonTree(obj), float[][].class);
    }

    public static boolean[][] toBoolMatrix(Object obj) {
        return gson.fromJson(gson.toJsonTree(obj), boolean[][].class);
    }

    public static String[][] toStringMatrix(Object obj) {
        return gson.fromJson(gson.toJsonTree(obj), String[][].class);
    }

    public static int[][] toIntMatrix(Object obj) {
        return gson.fromJson(gson.toJsonTree(obj), int[][].class);
    }

    public static char[] toCharArray(Object obj) {
        ArrayList<?> list = gson.fromJson(gson.toJsonTree(obj), ArrayList.class);
        char[] out = new char[list.size()];
        for (int i = 0; i < list.size(); i++) out[i] = toChar(list.get(i));
        return out;
    }

    public static char[][] toCharMatrix(Object obj) {
        ArrayList<?> rows = gson.fromJson(gson.toJsonTree(obj), ArrayList.class);
        char[][] out = new char[rows.size()][];
        for (int i = 0; i < rows.size(); i++) out[i] = toCharArray(rows.get(i));
        return out;
    }
}

// from https://docs.oracle.com/javase/8/javafx/api/javafx/util/Pair.html
class Pair<K, V> {

    private K key;
    private V value;

    public Pair(K key, V value) {
        this.key = key;
        this.value = value;
    }

    public K getKey() {
        return key;
    }

    public V getValue() {
        return value;
    }

    @Override
    public String toString() {
        return key + "=" + value;
    }

    @Override
    public int hashCode() {
        return key.hashCode() * 13 +
               (value == null ? 0 : value.hashCode());
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if (!(obj instanceof Pair<?, ?> pair)) {
            return false;
        }

        if (key != null ? !key.equals(pair.key) : pair.key != null) {
            return false;
        }

        return value != null
                ? value.equals(pair.value)
                : pair.value == null;
    }
}
