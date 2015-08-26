//
//  ViewController.m
//  UploadImageTest
//
//  Created by ShawnChen on 8/26/15.
//  Copyright (c) 2015 ShawnChen. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSDictionary *dic =@{@"fdsfd":@"fdsfds"};
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObject:@"text/html"];
    
    NSString * url = @"http://139.162.12.209/financialLoan/upload.php";
    UIImage * image = [UIImage imageNamed:@"fdsfds.png"];
    
    [manager POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:UIImagePNGRepresentation(image) name:@"fileToUpload" fileName:@"test.png"mimeType:@"image/png"];
    }success:^(AFHTTPRequestOperation *operation,id responseObject) {
        NSString * string = [NSString stringWithUTF8String:[operation.responseData bytes]];
        NSLog(@"%@", string);
    }failure:^(AFHTTPRequestOperation *operation,NSError *error) {
        NSString * string = [NSString stringWithUTF8String:[operation.responseData bytes]];
        NSLog(@"%@", string);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
