class Solution {
    func minimumScore(_ nums: [Int], _ edges: [[Int]]) -> Int {
        let n = nums.count
        var tree = [[Int]](repeating: [], count: n)
        for e in edges {
            tree[e[0]].append(e[1])
            tree[e[1]].append(e[0])
        }

        var subXor = [Int](repeating: 0, count: n)
        var inTime = [Int](repeating: 0, count: n)
        var outTime = [Int](repeating: 0, count: n)
        var time = 0

        // DFS to calculate subtree XOR and Euler tour timings
        func dfs(_ node: Int, _ parent: Int) {
            inTime[node] = time
            time += 1
            subXor[node] = nums[node]
            for nei in tree[node] {
                if nei == parent { continue }
                dfs(nei, node)
                subXor[node] ^= subXor[nei]
            }
            outTime[node] = time
        }

        dfs(0, -1)
        let totalXor = subXor[0]
        var minScore = Int.max

        // Extract all edges with parent-child order
        var directedEdges = [(parent: Int, child: Int)]()
        func markDirectedEdges(_ node: Int, _ parent: Int) {
            for nei in tree[node] {
                if nei == parent { continue }
                directedEdges.append((node, nei))
                markDirectedEdges(nei, node)
            }
        }
        markDirectedEdges(0, -1)

        // Check if u is ancestor of v
        func isAncestor(_ u: Int, _ v: Int) -> Bool {
            return inTime[u] <= inTime[v] && outTime[v] <= outTime[u]
        }

        // Try all pairs of edges
        for i in 0..<directedEdges.count {
            let (u1, v1) = directedEdges[i]
            for j in i+1..<directedEdges.count {
                let (u2, v2) = directedEdges[j]

                var xor1 = subXor[v1]
                var xor2 = subXor[v2]
                var xor3 = totalXor

                if isAncestor(v1, v2) {
                    // v2 is in subtree of v1
                    xor1 = subXor[v1] ^ subXor[v2]
                    xor2 = subXor[v2]
                    xor3 = totalXor ^ subXor[v1]
                } else if isAncestor(v2, v1) {
                    // v1 is in subtree of v2
                    xor1 = subXor[v1]
                    xor2 = subXor[v2] ^ subXor[v1]
                    xor3 = totalXor ^ subXor[v2]
                } else {
                    xor3 = totalXor ^ subXor[v1] ^ subXor[v2]
                }

                let maxX = max(xor1, xor2, xor3)
                let minX = min(xor1, xor2, xor3)
                minScore = min(minScore, maxX - minX)
            }
        }

        return minScore
    }
}
