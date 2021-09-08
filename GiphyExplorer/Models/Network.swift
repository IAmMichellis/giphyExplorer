
import UIKit

class Network {
    static let shared = Network()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchRandomGiphy(callback: @escaping (GiphyGif?, Error?) -> Void) {
        if let url = URL(string: "https://api.giphy.com/v1/gifs/random?api_key=RrRpy6fMj20Uz03LWCdQppQsUSMjJUV0&rating=g") {
            let urlSession = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print("error getting random from giphy: \(error.localizedDescription)")
                    callback(nil, error)
                }
                
                if let data = data {
                    do {
                        let giphyData = try JSONDecoder(context: self.context).decode(GiphyGif.self, from: data)
                        try self.context.save()
                        callback(giphyData, nil)
                    }  catch {
                        print("CONTEXT DIDN'T SAVE")
                        callback(nil, error)
                    }
                    
                }
            }
            urlSession.resume()
        }
    }
}
