//
//  CLDAdvOcrResult.swift
//
//  Copyright (c) 2016 Cloudinary (http://cloudinary.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

@objcMembers open class CLDAdvOcrResult: CLDBaseResult {
    
    open var status: String? {
        guard let status = getParam(.status) as? String else { return nil }
        
        return status
    }
    open var data: [CLDOcrDataResult]? {
        guard let data = getParam(.data) as? [[String : AnyObject]] else { return nil }
        
        return data.compactMap{ CLDOcrDataResult(json: $0) }
    }
    
    // MARK: - Private Helpers
    fileprivate func getParam(_ param: CLDAdvOcrResultKey) -> AnyObject? {
        return resultJson[String(describing: param)]
    }
    
    fileprivate enum CLDAdvOcrResultKey: CustomStringConvertible {
        case status, data
        
        var description: String {
            switch self {
            case .status: return "status"
            case .data  : return "data"
            }
        }
    }
}
