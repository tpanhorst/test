//
//  AppDelegate.m
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 02/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import "AppDelegate.h"
#import "Product_Export_Establishment.h"
#import "In_kind_volunteers.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSUserDefaults *prfes=[NSUserDefaults standardUserDefaults];
    [prfes setObject:@"1234" forKey:@"PassCode"];
    [prfes synchronize];
    NSURL *txtPath = [[NSBundle mainBundle] URLForResource:@"AREarlyLearning" withExtension:@"txt"];
    NSString*stringPath = [txtPath absoluteString];
    NSData *dataApp=[NSData dataWithContentsOfURL:[NSURL URLWithString:stringPath]];
   NSDictionary *dicValueDataApp = [NSJSONSerialization JSONObjectWithData:dataApp options:kNilOptions error:nil];
    NSURL *txtPathDonor=[[NSBundle mainBundle]URLForResource:@"ProductDescription" withExtension:@"txt"];
    NSString *StrPathDOn=[txtPathDonor absoluteString];
    NSData *dataDonor=[NSData dataWithContentsOfURL:[NSURL URLWithString:StrPathDOn]];
    NSDictionary *dictValueDon=[NSJSONSerialization JSONObjectWithData:dataDonor options:kNilOptions error:nil];
    
    int i=1;
    for (NSDictionary *dictCurrent in [[dictValueDon objectForKey:@"Records"] objectForKey:@"Record"])
    {
        NSManagedObjectContext *ObjContext=[self managedObjectContext];
        In_kind_volunteers *UserInfo=[NSEntityDescription
                                                insertNewObjectForEntityForName:@"In_kind_volunteers"
                                                inManagedObjectContext:ObjContext];
        UserInfo.userId=[[dictCurrent objectForKey:@"Row"] objectForKey:@"-A"];
        UserInfo.fname=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-B"];
        UserInfo.lname=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-C"];
        UserInfo.cellNum=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-E"];
        UserInfo.date=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-F"];
        UserInfo.street=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-G"];
        UserInfo.state=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-I"];
        UserInfo.cntry=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-J"];
        UserInfo.pin=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-K"];
        UserInfo.street2=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-L"];
        
        
    }
    
    for (NSDictionary *dictCurrent in [[dicValueDataApp objectForKey:@"Records"] objectForKey:@"Record"])
    {
        NSManagedObjectContext *ObjContext=[self managedObjectContext];
       Product_Export_Establishment *UserInfo=[NSEntityDescription
                        insertNewObjectForEntityForName:@"Product_Export_Establishment"
                        inManagedObjectContext:ObjContext];
        UserInfo.productClass=[[dictCurrent objectForKey:@"Row"] objectForKey:@"-A"];
        UserInfo.productCategory=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-B"];
        UserInfo.productSubcategory=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-C"];
        UserInfo.productName=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-D"];
        UserInfo.productDescription=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-E"];
        UserInfo.price=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-F"];
        UserInfo.cost=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-G"];
        UserInfo.tax=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-H"];
        UserInfo.sku=[[dictCurrent objectForKey:@"Row"]objectForKey:@"-J"];
        
    }
    return YES;
}
-(NSArray *)SearchDonors:(NSString*)StrField
{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"In_kind_volunteers" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    [request setReturnsObjectsAsFaults:NO];
    NSPredicate * idPredicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"productDescription = '%@'",StrField]];
    [request setPredicate:idPredicate];
    
    NSError *error = nil;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if ([objects count]>0) {
        return objects;
        
    }
    
    return nil;
}

-(NSArray *)getDonors
{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"In_kind_volunteers" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    [request setReturnsObjectsAsFaults:NO];
    //NSPredicate * idPredicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"productDescription = '%@'",StrProdescp]];
    //[request setPredicate:idPredicate];
    
    NSError *error = nil;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if ([objects count]>0) {
        return objects;
        
    }
    
    
    
    return nil;
}

-(NSArray *)getProdPirce:(NSString *)StrProdescp
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Product_Export_Establishment" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    [request setReturnsObjectsAsFaults:NO];
    NSPredicate * idPredicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"productDescription = '%@'",StrProdescp]];
    [request setPredicate:idPredicate];
    
    NSError *error = nil;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if ([objects count]>0) {
        return objects;
        
    }

    return nil;
}

-(NSArray *)GetProdDescp:(NSString *)StrSubDescp
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Product_Export_Establishment" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    [request setReturnsObjectsAsFaults:NO];
    NSPredicate * idPredicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"productName = '%@'",StrSubDescp]];
    [request setPredicate:idPredicate];
    
    NSError *error = nil;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if ([objects count]>0) {
        return objects;
        
    }


    return nil;
}


-(NSArray *)getSubCatItem:(NSString *)StrSUbItem
{  NSManagedObjectContext *context = [self managedObjectContext];

    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Product_Export_Establishment" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    [request setReturnsObjectsAsFaults:NO];
    NSPredicate * idPredicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"productSubcategory = '%@'",StrSUbItem]];
    [request setPredicate:idPredicate];
    
    NSError *error = nil;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if ([objects count]>0) {
        return objects;
        
    }
    
    return nil;
}

-(NSArray*)getDataItemFrom:(NSString*)strItem
{  NSManagedObjectContext *context = [self managedObjectContext];
    
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Product_Export_Establishment" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    [request setReturnsObjectsAsFaults:NO];
    NSPredicate * idPredicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"productCategory = '%@'",strItem]];
    [request setPredicate:idPredicate];
    
    NSError *error = nil;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if ([objects count]>0) {
        return objects;
        
    }
    return nil;

}
-(NSArray*)getDataCategory
{
    NSManagedObjectContext *context=[self managedObjectContext];
    NSEntityDescription *enetitYDesc=[NSEntityDescription entityForName:@"Product_Export_Establishment" inManagedObjectContext:context];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:enetitYDesc];
    [request setReturnsObjectsAsFaults:NO];
    
   NSError *error = nil;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if ([objects count]>0) {
        return objects;
        
    }
    return nil;
}



- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
      return  UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}
-(BOOL)shouldAutorotate
{
    return NO;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "Sreejith-Rajan.AREarlyLearningApp" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"AREarlyLearningApp" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"AREarlyLearningApp.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}
- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
