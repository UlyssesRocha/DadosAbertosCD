//
//  ViewController.m
//  DadosAbertosDeputados
//
//  Created by Ulysses on 3/3/16.
//  Copyright © 2016 DadosAbertosBrasil. All rights reserved.
//

#import "ViewController.h"
#import "XMLDictionary.h"
#import "URLManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSNumber *idDeputado = [NSNumber numberWithInt:141428];
    
    NSData *partidosPorBloco = [NSData dataWithContentsOfURL:[NSURL URLWithString: [URLManager obterPartidosBlocoCDPorID:@"" comNumLegislatura:@""]]];
    
    
    NSDictionary *dic = [NSDictionary dictionaryWithXMLData:partidosPorBloco];
    
    NSLog(@"%@",dic);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
