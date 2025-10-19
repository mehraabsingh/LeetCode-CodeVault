class Solution {
    func findLexSmallestString(_ s: String, _ a: Int, _ b: Int) -> String {
        let n = s.count
        var seen = Set<String>()
        var queue = [s]
        var chars = Array(s)
        var ans = s

        func addA(_ str: [Character]) -> [Character] {
            var arr = str
            for i in stride(from: 1, to: n, by: 2) {
                let val = (Int(String(arr[i]))! + a) % 10
                arr[i] = Character("\(val)")
            }
            return arr
        }

        func rotateB(_ str: [Character]) -> [Character] {
            let k = n - b
            return Array(str[k..<n] + str[0..<k])
        }

        while !queue.isEmpty {
            let cur = queue.removeFirst()
            if cur < ans { ans = cur }
            if seen.contains(cur) { continue }
            seen.insert(cur)
            let arr = Array(cur)
            let addStr = String(addA(arr))
            let rotStr = String(rotateB(arr))
            if !seen.contains(addStr) { queue.append(addStr) }
            if !seen.contains(rotStr) { queue.append(rotStr) }
        }
        return ans
    }
}
