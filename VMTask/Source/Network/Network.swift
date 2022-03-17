import UIKit

class Network {
    
    private init (){}
    
    public static let shared = Network()
    let session: URLSession = URLSession(configuration: .default)
    
    func getBaseUrl() -> String {
        return "https://61e947967bc0550017bc61bf.mockapi.io/api/v1"
    }
    
    func getPersonUrl() -> String {
        return "/people"
    }
    
    func getRoomsUrl() -> String {
        return "/rooms"
    }
    
    func fetch<T: Decodable>(
        decodeType: T.Type,urlString:String,
        handler: @escaping (([Person]) ->())) {
        let URLString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(
            string: URLString ?? "")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: request) { data, response, error in
            do {
                let models = try JSONDecoder().decode(
                    [Person].self,
                    from: data!)
                handler(models)
            } catch let error {
             // print("err is \(error)")
            }
        }.resume()
    }
    
    
}

enum Error: Swift.Error {
    case badURL
    case decoding(Swift.Error)
    case emptyData
    case network(Swift.Error)
}


