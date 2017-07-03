//
//  ViewController.h
//  SearchControllerOC
//
//  Created by Bhavesh Dhaduk on 6/30/17.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating>


@property (nonatomic, weak) IBOutlet UITableView * tableView;
@property (nonatomic, strong) UISearchController * searchController;
@property (nonatomic, strong) NSMutableArray * allItems;
@property (nonatomic, strong) NSMutableArray * filteredItems;
@property (nonatomic, weak) NSArray * displayedItems;

@end

