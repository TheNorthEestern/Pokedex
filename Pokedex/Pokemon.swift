//
//  Pokemon.swift
//  Pokedex
//
//  Created by Kacy James on 11/21/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _types : [Dictionary<String, String>]!
    private var _computedType : String! = ""
    private var _height: String!
    private var _weight: String!
    private var _pokemonURL: String!
    var description: String {
        if _description == nil {
            _description = "Finding description..."
        }
        return _description
    }
    
    var types: [Dictionary<String, String>] {
        return _types
    }
    
    var computedType: String {
        return _computedType.capitalized
    }
    
    var height: String {
        return _height
    }
    
    var weight: String {
        return _weight
    }
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init (name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
                    for (index, type) in types.enumerated() {
                        self._computedType = self._computedType! + (type["name"]?.capitalized)!
                        if index < types.count - 1 {
                            self._computedType = self._computedType + "/"
                        }
                    }
                    self._computedType = self._computedType + " Pokemon"
                } else {
                    self._computedType = "No type data found."
                }
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>] , descArr.count > 0 {
                    
                    if let url = descArr[0]["resource_uri"] {
                        
                        let descURL = "\(URL_BASE)\(url)"
                        
                        Alamofire.request(descURL).responseJSON(completionHandler: { (response) in
                            
                            if let descDict = response.result.value as? Dictionary<String, AnyObject> {
                                
                                if let description = descDict["description"] as? String {
                                    
                                    let newDescription = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    
                                    self._description = newDescription
                                    print(newDescription)
                                }
                            }
                            
                            completed()
                        })
                    }
                } else {
                    
                    self._description = ""
                }
            }
            completed()
        }
    }
}
