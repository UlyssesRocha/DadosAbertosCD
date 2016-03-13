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
#import "CDProposicao.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    UIImageView *testImageView;
//    [CDDeputado loadDeputados:^(NSArray *response) {
//        NSLog(@"%@",((CDDeputado *)[response objectAtIndex:0]).nomeParlamentar);
//        for (int i=0; i<[response count]; i++) {
//            [(CDDeputado* )[response objectAtIndex:i] loadPresencasInTheLast:12 withCompletionHandler:^{
//                for (NSDictionary *dia in [[response objectAtIndex:i] presencas]) {
//                    if ([[[dia objectForKey:@"frequencianoDia"] objectForKey:@"text"] isEqualToString:@"Presença"] == NO) {
//                        
//                        NSLog(@"%@\n%@\n%@, %@ \n\n\r",[[dia objectForKey:@"frequencianoDia"] objectForKey:@"text"],
//                                                            [[response objectAtIndex:i] nomeParlamentar],
//                                                            [[dia objectForKey:@"data"] objectForKey:@"text"],
//                                                            [[dia objectForKey:@"justificativa"] objectForKey:@"text"]);
//                    }
//                }
//            }];
//        }
//    }];
    
    
//    CDProposicao *testProposicao = [[CDProposicao alloc]initWithCodProposicao:[NSNumber numberWithInt:2078488]];
//    [testProposicao loadProposicao:^{
//        [testProposicao loadVotacoes:^{
//            NSLog(@"%@",testProposicao);
//        }];
//    }];
//    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
