class Router {
    let memoryLimit: Int
    var queue = [[Int]]()
    var set = Set<String>()
    var destMap = [Int: [Int]]()
    
    init(_ memoryLimit: Int) {
        self.memoryLimit = memoryLimit
    }
    
    func addPacket(_ source: Int, _ destination: Int, _ timestamp: Int) -> Bool {
        let key = "\(source)-\(destination)-\(timestamp)"
        if set.contains(key) { return false }
        if queue.count == memoryLimit {
            let old = queue.removeFirst()
            let oldKey = "\(old[0])-\(old[1])-\(old[2])"
            set.remove(oldKey)
            if var arr = destMap[old[1]], let idx = arr.firstIndex(of: old[2]) {
                arr.remove(at: idx)
                destMap[old[1]] = arr
            }
        }
        queue.append([source, destination, timestamp])
        set.insert(key)
        destMap[destination, default: []].append(timestamp)
        return true
    }
    
    func forwardPacket() -> [Int] {
        if queue.isEmpty { return [] }
        let packet = queue.removeFirst()
        let key = "\(packet[0])-\(packet[1])-\(packet[2])"
        set.remove(key)
        if var arr = destMap[packet[1]], let idx = arr.firstIndex(of: packet[2]) {
            arr.remove(at: idx)
            destMap[packet[1]] = arr
        }
        return packet
    }
    
    func getCount(_ destination: Int, _ startTime: Int, _ endTime: Int) -> Int {
        guard let arr = destMap[destination] else { return 0 }
        var count = 0
        for t in arr {
            if t >= startTime && t <= endTime {
                count += 1
            }
        }
        return count
    }
}
