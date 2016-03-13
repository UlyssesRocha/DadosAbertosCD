//
//  CDVotacao.m
//  DadosAbertosDeputados
//
//  Created by Ulysses on 3/10/16.
//  Copyright © 2016 DadosAbertosBrasil. All rights reserved.
//

#import "CDVotacao.h"

@implementation CDVotacao


- (instancetype)initWithDictionary:(NSDictionary*)dictionary{
    self = [super self];
    if (self){
        
        self.resumo = [dictionary objectForKey:@"Resumo"];
        
        //Brazilia GMT-03:00
        NSDateFormatter *dataFormat = [[NSDateFormatter alloc] init];
        [dataFormat setDateFormat:@"dd/MM/yyy HH:mm ZZZZ"];
        NSString *dataHora = [NSString stringWithFormat:@"%@ %@ GMT-03:00",[dictionary objectForKey:@"Data"],[dictionary objectForKey:@"Hora"]];
        self.data = [dataFormat dateFromString: dataHora];
        
        self.hora = [dictionary objectForKey:@"Hora"];
        self.objVotacao = [[dictionary objectForKey:@"ObjVotacao"] capitalizedString];
        
        self.codSessao = [dictionary objectForKey:@"codSessao"];
        self.votoDeputados = [[dictionary objectForKey:@"votos"] objectForKey:@"Deputado"];
        
        
    }
    return self;
}

@end
