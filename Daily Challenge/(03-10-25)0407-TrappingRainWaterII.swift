class Solution {
    func trapRainWater(_ heightMap: [[Int]]) -> Int {
        let m = heightMap.count
        let n = heightMap[0].count
        if m < 3 || n < 3 { return 0 }  // too small to trap water

        var visited = Array(repeating: Array(repeating: false, count: n), count: m)

        // Min-heap (priority queue) storing (height, row, col)
        var heap = [(Int, Int, Int)]()
        func push(_ h: Int, _ r: Int, _ c: Int) {
            heap.append((h, r, c))
            heap.sort { $0.0 < $1.0 } // min-heap behavior
        }

        func pop() -> (Int, Int, Int) {
            return heap.removeFirst()
        }

        // Step 1: Push all boundary cells into heap
        for i in 0..<m {
            for j in [0, n-1] {
                push(heightMap[i][j], i, j)
                visited[i][j] = true
            }
        }
        for j in 0..<n {
            for i in [0, m-1] {
                if !visited[i][j] {
                    push(heightMap[i][j], i, j)
                    visited[i][j] = true
                }
            }
        }

        // Step 2: BFS with heap
        let dirs = [(1,0), (-1,0), (0,1), (0,-1)]
        var trappedWater = 0

        while !heap.isEmpty {
            let (h, r, c) = pop()

            for (dr, dc) in dirs {
                let nr = r + dr, nc = c + dc
                if nr >= 0 && nr < m && nc >= 0 && nc < n && !visited[nr][nc] {
                    visited[nr][nc] = true
                    let nh = heightMap[nr][nc]
                    if nh < h {
                        trappedWater += h - nh
                    }
                    push(max(h, nh), nr, nc)
                }
            }
        }

        return trappedWater
    }
}
