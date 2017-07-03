//
//  ViewController.swift
//  SearchControllerSwift
//
//  Created by Bhavesh Dhaduk on 6/30/17.
//  Copyright © 2017 Bhavesh Dhaduk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchController = UISearchController()
    var allItems = NSMutableArray()
    var filteredItems  = NSMutableArray()
    var displayedItems = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.allItems.add("Apples")
        self.allItems.add("Oranges")
        self.allItems.add("Pears")
        self.allItems.add("Grapes")
        self.allItems.add("Grapefruits")
        self.allItems.add("Lemons")
        self.allItems.add("Peaches")
        self.allItems.add("Pineapples")
        self.allItems.add("Cherries")
        self.allItems.add("Bananas")
        self.allItems.add("Watermelons")
        self.allItems.add("Cantaloupes")
        self.allItems.add("Limes")
        self.allItems.add("Strawberries")
        self.allItems.add("Blueberries")
        self.allItems.add("Raspberries")
        print(self.allItems)
        
        // Create a list to hold search results (filtered list)
        self.filteredItems = NSMutableArray()
        
        // Initially display the full list.  This variable will toggle between the full and the filtered lists.
        self.displayedItems = self.allItems
        
        
        // Here's where we create our UISearchController
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false;
        self.searchController.dimsBackgroundDuringPresentation = false;
        self.searchController.searchBar.sizeToFit();
        
        //Add the UISearchBar to the top header of the table view
        self.tableView.tableHeaderView = self.searchController.searchBar;
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath)
        cell.textLabel?.text = self.displayedItems[row] as? String
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text;
        
        if let string = searchString, !string.isEmpty {
            self.filteredItems.removeAllObjects()
            for str in self.allItems{
                if let string = searchString, !string.isEmpty, (str as AnyObject).localizedCaseInsensitiveContains(string){
                    self.filteredItems.add(str)
                }
            }
            self.displayedItems = self.filteredItems
        }
        else{
            self.displayedItems = self.allItems
        }
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

