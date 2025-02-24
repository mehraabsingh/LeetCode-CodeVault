class Solution {
  public int mostProfitablePath(int[][] edges, int bob, int[] amount) {
    final int n = amount.length;
    List<Integer>[] tree = new List[n];
    int[] parent = new int[n];
    int[] aliceDist = new int[n];
    Arrays.fill(aliceDist, -1);

    for (int i = 0; i < n; ++i)
      tree[i] = new ArrayList<>();

    for (int[] edge : edges) {
      final int u = edge[0];
      final int v = edge[1];
      tree[u].add(v);
      tree[v].add(u);
    }

    dfs(tree, 0, -1, 0, parent, aliceDist);


    for (int u = bob, bobDist = 0; u != 0; u = parent[u], ++bobDist)
      if (bobDist < aliceDist[u])
        amount[u] = 0;
      else if (bobDist == aliceDist[u])
        amount[u] /= 2;

    return getMoney(tree, 0, -1, amount);
  }


  private void dfs(List<Integer>[] tree, int u, int prev, int d, int[] parent, int[] dist) {
    parent[u] = prev;
    dist[u] = d;
    for (final int v : tree[u]) {
      if (dist[v] == -1)
        dfs(tree, v, u, d + 1, parent, dist);
    }
  }

  private int getMoney(List<Integer>[] tree, int u, int prev, int[] amount) {

    if (tree[u].size() == 1 && tree[u].get(0) == prev)
      return amount[u];

    int maxPath = Integer.MIN_VALUE;
    for (final int v : tree[u])
      if (v != prev)
        maxPath = Math.max(maxPath, getMoney(tree, v, u, amount));

    return amount[u] + maxPath;
  }
}
