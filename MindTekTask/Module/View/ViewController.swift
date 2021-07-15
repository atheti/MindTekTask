//
//  ViewController.swift
//  MindTekTask
//
//  Created by Anji Atheti on 14/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var listingTableView: UITableView!
    
    private var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
        updateUI()
        viewModelObserver()
        
    }
    
    private func updateUI() {
        DispatchQueue.main.async {
            self.listingTableView.reloadData()
        }
    }
    
    private func updteCoutriesSection(section:Int) {
        UIView.setAnimationsEnabled(false)
        listingTableView.reloadSections(IndexSet(integer: section), with: .fade)
        UIView.setAnimationsEnabled(true)
    }
    
    @discardableResult
    private func viewForHeadrSection() -> UIView {
        var headerView = SearchHeaderView()
        headerView = UIView.fromNib()
        headerView.delegate = viewModel
        let searchRext = viewModel.searchText
        let isBecameFirstResponser = !listingTableView.isDragging && !searchRext.isBlank
        headerView.updateSearchUIAndContent(text: searchRext,
                                            isBecameFirstResponder: isBecameFirstResponser)
        return headerView
    }


    private func viewModelObserver() {
        viewModel.updateUI = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.updteCoutriesSection(section: 1)
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section == 0 else {
            return viewModel.countries.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeue(cell: CarouselCollectionViewTableViewCell.self, at: indexPath)
            let imagesArray = viewModel.imageData
            cell.setupCollectionView(images: imagesArray)
            return cell
        case 1:
            let cell = tableView.dequeue(cell: CountryTableViewCell.self, at: indexPath)
            let countries = viewModel.countries[indexPath.row]
            cell.setupCountryLabel(name: countries.name)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 1 else { return nil }
        return viewForHeadrSection()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section == 1 else { return 0}
        return 60
    }
}
