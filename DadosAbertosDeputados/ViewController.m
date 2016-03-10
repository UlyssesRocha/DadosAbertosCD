//
//  ViewController.m
//  DadosAbertosDeputados
//
//  Created by Ulysses on 3/3/16.
//  Copyright © 2016 DadosAbertosBrasil. All rights reserved.
//

#import "ViewController.h"
#import "CDURLManager.h"
#import "XMLReader.h"
#import "AFNetworking.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *adress = [CDURLManager obterDeputados];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:adress]];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =  [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/xml"];
    
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSError *parseError = nil;

        NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLData:responseObject error:&parseError];

        NSLog(@"Response string: %@",[xmlDictionary objectForKey:@"deputados"]);
    }];
    [task resume];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
