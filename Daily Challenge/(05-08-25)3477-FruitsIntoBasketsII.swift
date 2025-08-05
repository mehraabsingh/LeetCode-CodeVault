class Solution {
    func numOfUnplacedFruits(_ fruits: [Int], _ baskets: [Int]) -> Int {
        let n = fruits.count
        var used = Array(repeating: false, count: n)
        var unplaced = 0

        for i in 0..<n {
            var placed = false
            for j in 0..<n {
                if !used[j] && baskets[j] >= fruits[i] {
                    used[j] = true
                    placed = true
                    break
                }
            }
            if !placed {
                unplaced += 1
            }
        }

        return unplaced
    }
}
