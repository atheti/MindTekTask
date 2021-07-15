//
//  SearchHeaderView.swift
//  MindTekTask
//
//  Created by Anji Atheti on 14/07/21.
//

import UIKit

protocol SearchHeaderViewDelegate: class {
    func textUpdate(view: SearchHeaderView, search: String)
}

class SearchHeaderView: UIView {
    
    @IBOutlet weak var searchBar: UISearchBar!
    weak var delegate: SearchHeaderViewDelegate?
    
    func updateSearchUIAndContent(text: String, isBecameFirstResponder: Bool) {
        searchBar.text = text
        guard isBecameFirstResponder else {
            searchBar.resignFirstResponder()
            return
        }
        searchBar.becomeFirstResponder()
    }
}

extension SearchHeaderView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.textUpdate(view: self, search: searchBar.text ?? "")
    }
}
