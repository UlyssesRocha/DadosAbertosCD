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
#import "CDDeputado.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *testImageView;
    
    [CDDeputado loadDeputados:^(NSArray *response) {
        NSLog(@"%@",((CDDeputado *)[response objectAtIndex:0]).nomeParlamentar);
        
        [(CDDeputado* )[response objectAtIndex:66]loadPhoto:self.depImage];
    }];
    
    NSLog(@"fim");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
