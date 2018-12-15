//
//  RedditPostScreenViewController.swift
//  Redddd
//
//  Created by Badi Parvaneh on 12/14/18.
//  Copyright © 2018 Badi Parvaneh. All rights reserved.
//

import UIKit

class RedditPostScreenViewController: UIViewController {

    var posts: [Post] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let addr: String = "https://www.reddit.com/r/berkeley.json?limit=10"
        guard let url = URL(string: addr) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else {return}
            do {
                let json = try JSONDecoder().decode(Json.self, from: data)
                for index in 0...json.data.children.count - 1 {
                    let tempName = json.data.children[index].data.author
                    let tempMsg = json.data.children[index].data.title
                    let tempPost = Post(username: tempName, msg: tempMsg)
                    self.posts.append(tempPost)
                }
                
            } catch let jsonErr {
                print("Error is:", jsonErr)
                
            }
            DispatchQueue.main.async {
                self.tableView!.reloadData()
            }
            
        }.resume()
    }
    
}

extension RedditPostScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier:  "PostCell") as! PostCell
        cell.setPost(post: post)
        return cell
    }
    
}
