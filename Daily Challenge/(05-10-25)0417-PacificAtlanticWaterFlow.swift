class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let m = heights.count
        let n = heights[0].count
        
        var pacific = Array(repeating: Array(repeating: false, count: n), count: m)
        var atlantic = Array(repeating: Array(repeating: false, count: n), count: m)
        
        let directions = [(1,0), (-1,0), (0,1), (0,-1)]
        
        func dfs(_ r: Int, _ c: Int, _ visited: inout [[Bool]]) {
            visited[r][c] = true
            for (dr, dc) in directions {
                let nr = r + dr, nc = c + dc
                if nr >= 0, nr < m, nc >= 0, nc < n,
                   !visited[nr][nc],
                   heights[nr][nc] >= heights[r][c] {
                    dfs(nr, nc, &visited)
                }
            }
        }
        
        // Start from Pacific borders (top row, left col)
        for i in 0..<m {
            dfs(i, 0, &pacific)         // left edge
            dfs(i, n - 1, &atlantic)    // right edge
        }
        for j in 0..<n {
            dfs(0, j, &pacific)         // top edge
            dfs(m - 1, j, &atlantic)    // bottom edge
        }
        
        var result = [[Int]]()
        for i in 0..<m {
            for j in 0..<n {
                if pacific[i][j] && atlantic[i][j] {
                    result.append([i, j])
                }
            }
        }
        
        return result
    }
}
