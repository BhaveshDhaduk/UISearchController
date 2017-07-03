//
//  ViewController.m
//  SearchControllerOC
//
//  Created by Bhavesh Dhaduk on 6/30/17.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UISearchController";
    
    self.allItems = [[NSMutableArray alloc] init];
    [self.allItems addObject:@"Apples"];
    [self.allItems addObject:@"Oranges"];
    [self.allItems addObject:@"Pears"];
    [self.allItems addObject:@"Grapes"];
    [self.allItems addObject:@"Grapefruits"];
    [self.allItems addObject:@"Lemons"];
    [self.allItems addObject:@"Peaches"];
    [self.allItems addObject:@"Pineapples"];
    [self.allItems addObject:@"Cherries"];
    [self.allItems addObject:@"Bananas"];
    [self.allItems addObject:@"Watermelons"];
    [self.allItems addObject:@"Cantaloupes"];
    [self.allItems addObject:@"Limes"];
    [self.allItems addObject:@"Strawberries"];
    [self.allItems addObject:@"Blueberries"];
    [self.allItems addObject:@"Raspberries"];
    
    // Create a list to hold search results (filtered list)
    self.filteredItems = [[NSMutableArray alloc] init];
    
    // Initially display the full list.  This variable will toggle between the full and the filtered lists.
    self.displayedItems = self.allItems;
    
    // Here's where we create our UISearchController
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.delegate = self;
    self.searchController.hidesNavigationBarDuringPresentation = false;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    [self.searchController.searchBar sizeToFit];
    
    // Add the UISearchBar to the top header of the table view
    self.tableView.tableHeaderView = self.searchController.searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    return [self.displayedItems count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)anIndexPath {
    
    UITableViewCell * cell = [aTableView dequeueReusableCellWithIdentifier:@"FruitCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = [self.displayedItems objectAtIndex:anIndexPath.row];
    return cell;
}

// When the user types in the search bar, this method gets called.
- (void)updateSearchResultsForSearchController:(UISearchController *)aSearchController {
    
    NSString *searchString = aSearchController.searchBar.text;
    // Check if the user cancelled or deleted the search term so we can display the full list instead.
    if (![searchString isEqualToString:@""]) {
        [self.filteredItems removeAllObjects];
        for (NSString *str in self.allItems) {
            if ([searchString isEqualToString:@""] || [str localizedCaseInsensitiveContainsString:searchString] == YES) {
                [self.filteredItems addObject:str];
            }
        }
        self.displayedItems = self.filteredItems;
    }
    else {
        self.displayedItems = self.allItems;
    }
    [self.tableView reloadData];
}


@end
