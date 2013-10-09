#NSCoding

###Storing A Simple Model

**User Model**

```objc
// User.h

@interface User : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSDate *dateJoined;

@end
```

```objc
// User.m

@implementation User

- (id)initWithCoder:(NSCoder *)aDecoder
{

    self = [super init];

    if (self) {

        [self setName:[aDecoder decodeObjectForKey:@"name"]];
        [self setEmail:[aDecoder decodeObjectForKey:@"email"]];
        [self setDateJoined:[aDecoder decodeObjectForKey:@"dateJoined"]];

    }

    return self;

}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.dateJoined forKey:@"dateJoined"];

}

@end
```

**ViewController**

```objc
// ViewController.m

#import "ViewController.h"
#import "User.h"

@interface ViewController ()
{
    User *user;
}
@end

@implementation ViewController

- (void)viewDidLoad
{

    NSString *libraryDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *tempDir = [libraryDir stringByAppendingPathComponent:@"temp"];

    // Creates a User Model
    user = [NSKeyedUnarchiver unarchiveObjectWithFile:tempDir];

    NSLog(@"%@", user.name);

    [user setName:@"Scott Doxey"];

    // Stores the User Model
    [NSKeyedArchiver archiveRootObject:user toFile:tempDir];

    user = [NSKeyedUnarchiver unarchiveObjectWithFile:tempDir];

    NSLog(@"%@", [user name]);

}

@end
```