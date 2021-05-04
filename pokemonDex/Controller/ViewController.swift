//
//  ViewController.swift
//  pokemonDex
//
//  Created by X Y on 4/29/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var nextPege: String?
    private var pokemonList: [PokemonData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchPokemonList(withPage: nextPege)
    }
    
    // MARK: tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == pokemonList.count {
            fetchPokemonList(withPage: nextPege)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") as! PokemonCell
        let pokemon = pokemonList[indexPath.row]
        cell.pokemon = pokemon
        return cell
    }
    
    func fetchPokemonList(withPage page: String?) {
        let defaultSession = URLSession(configuration: .default)
        var url: URL!
        if let pageURL = page {
            url = URL(string: pageURL)
        } else {
            url = URL(string: "https://pokeapi.co/api/v2/pokemon")
        }
        let request = URLRequest(url: url)
        let dataTask = defaultSession.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print("error fetching data")
                return
            }
            
            guard let data = data else {
                print("Hey there's no data:(")
                return
            }
            
            let pokemonResult = try? JSONDecoder().decode(PokemonResult.self, from: data)
            self.nextPege = pokemonResult?.next
            
            //display pokemon data to tableView
            for pokemon in pokemonResult!.results{
                self.fetchPokemonData(withUrl: pokemon.url) { (pokemon) in
                    self.pokemonList.append(pokemon)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    func fetchPokemonData(withUrl url: String, completion: @escaping(PokemonData) -> ()) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        let session = URLSession.shared
        session.dataTask(with: request){ (data,response,error) in
        guard error == nil else {
            print("error", error!)
            return
        }
        guard let data = data else {
            print("no data object")
            return
        }
        let decoder = JSONDecoder()
        do {
            let jsonData = try decoder.decode(PokemonData.self, from: data)
            completion(jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }.resume()

}
}
