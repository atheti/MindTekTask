//
//  ViewModel.swift
//  MindTekTask
//
//  Created by Anji Atheti on 14/07/21.
//

import Foundation
import UIKit

class ViewModel {
    
    var imageData: [ImageModel] = []
    var countries: [CountryModel] = []
    var countriesStore: [CountryModel] = []
    var searchText = ""
    var updateUI:(() -> ())?
    
    let josnFileName = "country"
    
    func loadData() {
        imageData = getImages()
        countries = getCountries(fileName: josnFileName)
        countriesStore = countries
    }
        
    private func getImages() -> [ImageModel] {
        let imagesMOdelArray = [
            ImageModel(imageName: "Apple-1"),
            ImageModel(imageName: "Apple-2"),
            ImageModel(imageName: "Apple-3")
        ]
        return imagesMOdelArray
    }
    
    private func getCountries(fileName: String) -> [CountryModel] {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else { return [] }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let countryData = try decoder.decode([CountryModel].self, from: data)
            return countryData
        } catch {
            print("error:\(error)")
            return []
        }
    }
    
    func startSearch(searchString: String) {
        let isInvalidSearch = searchString.isBlank
        if isInvalidSearch {
            countries = countriesStore
        } else {
            countries = countriesStore.filter {($0.name ?? "").range(of: searchString , options: .caseInsensitive) != nil }
        }
    }
    
}

extension ViewModel: SearchHeaderViewDelegate {
    func textUpdate(view: SearchHeaderView, search: String) {
        searchText = search
        startSearch(searchString: search)
        updateUI?()
    }
}
