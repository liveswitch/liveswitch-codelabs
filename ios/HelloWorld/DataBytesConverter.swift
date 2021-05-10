
import Foundation

extension String {
    func toNSMutableData() -> NSMutableData {
        let nsData = self.data(using: .ascii)
        return NSMutableData(data: nsData!)
    }
}

extension Int32 {
    func toNSMutableData() -> NSMutableData {
        let nsData = withUnsafeBytes(of: self.bigEndian) {Data($0)}
        return NSMutableData(data: nsData)
    }
}

extension Data {
    func toNSMutableData() -> NSMutableData {
        return NSMutableData(data: self)
    }
}

extension NSMutableData {
    func toNSData() -> NSData {
        return self.copy() as! NSData
    }
    
    func toData() -> Data {
        return self.toNSData() as Data
    }
    
    func toInt(offset: Int) -> Int {
        let nsDataInt = self.toData().subdata(in: offset..<offset + MemoryLayout<Int32>.size)
        let valueInt = nsDataInt.withUnsafeBytes{
            $0.load(as: Int32.self)
        }
        return Int("\(valueInt.bigEndian)")!
    }
    
    func toString(offset: Int, length: Int) -> String {
        return self.toString(offset: offset, length: length, encoding: .ascii)
    }
    
    func toString(offset: Int, length: Int, encoding: String.Encoding) -> String{
        let nsDataString: Data = self.toData().subdata(in: offset..<offset + length)
        return String(data: nsDataString, encoding: encoding)!
    }
}


