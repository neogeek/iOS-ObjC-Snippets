#CoreData

###Saving, Fetching and Removing Objects

```objc
@interface ViewController ()
{

    NSManagedObjectContext *context;

}
@end

@implementation ViewController

- (void)viewDidLoad
{

    // Local Core Data Setup (required)

    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    context = [appdelegate managedObjectContext];

    // Saving to Core Data

    [self saveObjectsWithEntityName:@"Note" saveData:@[@{@"content":@"Lorem ipsum", @"lastModified":[NSDate new]}]];

    // Fetching from Core Data

    NSArray *results = [self fetchAllObjectsWithEntityName:@"Note" predicateString:nil];

    for (NSManagedObject *result in results) {

        NSLog(@"Note Contents: %@", [result valueForKey:@"content"]);

    }

    NSLog(@"Number of Notes: %lu", (unsigned long)[results count]);

    // Removing objects from Core Data

    [self removeObjectsWithEntityName:@"Note" objectsToRemove:@[[results objectAtIndex:0]]];

    results = [self fetchAllObjectsWithEntityName:@"Note" predicateString:nil];

    NSLog(@"Number of Notes: %lu", (unsigned long)[results count]);

}

/**
 * Saves an array of NSDictionary objects to the specified Core Data entity.
 *
 *  [self saveObjectsWithEntityName:@"Note" saveData:@[@{@"content":@"Lorem ipsum", @"lastModified":[NSDate new]}]];
 *
 * @param {NSString} saveObjectsWithEntityName The Core Data entity name.
 * @param {NSArray} saveData An array of NSDictionary objects to be saved.
 * @return {void}
 * @api public
 */

- (void)saveObjectsWithEntityName:(NSString *)entityName saveData:(NSArray *)saveData;
{

    NSError *error;

    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];

    for (NSDictionary *data in saveData) {

        NSManagedObject *newObj = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];

        for (NSString* key in data) {

            [newObj setValue:data[key] forKey:key];

        }

        [context save:&error];

        if (error) {

            [NSException raise:@"Error saving core data" format:@"%@", error];

        }

    }

}

/**
 * Removes an array of NSManagedObject objects from the specified Core Data entity.
 *
 *  [self removeObjectsWithEntityName:@"Note" objectsToRemove:@[[results objectAtIndex:0]]];
 *
 * @param {NSString} removeObjectsWithEntityName The Core Data entity name.
 * @param {NSArray} objectsToRemove An array of NSManagedObject objects to be removed.
 * @return {void}
 * @api public
 */

- (void)removeObjectsWithEntityName:(NSString *)entityName objectsToRemove:(NSArray *)removeObjects;
{

    NSError *error;

    for (NSManagedObject *obj in removeObjects) {

        [context deleteObject:obj];

        [context save:&error];

        if (error) {

            [NSException raise:@"Error removing core data" format:@"%@", error];

        }

    }

}

/**
 * Removes an array of NSManagedObject objects from the specified Core Data entity.
 *
 *  NSArray *results = [self fetchAllObjectsWithEntityName:@"Note" predicateString:nil];
 *
 * @param {NSString} fetchAllObjectsWithEntityName The Core Data entity name.
 * @param {NSString?} predicateString An optional predicate string.
 * @return {NSArray} An array of results.
 * @api public
 */

- (NSArray *)fetchAllObjectsWithEntityName:(NSString *)entityName predicateString:(NSString *)predicateString;
{

    NSError *error;

    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];

    if (predicateString) {
        [request setPredicate:[NSPredicate predicateWithFormat:predicateString]];
    }

    NSArray *results = [context executeFetchRequest:request error:&error];

    if (error) {

        [NSException raise:@"Error fetching core data" format:@"%@", error];

    }

    return results;

}

@end
```