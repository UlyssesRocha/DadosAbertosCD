//
//  CDProposicao.h
//  DadosAbertosDeputados
//
//  Created by Ulysses on 3/10/16.
//  Copyright © 2016 DadosAbertosBrasil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDProposicao : NSObject

@property NSNumber *idProposicao;
@property NSString *nome;
@property NSString *tipoProposicao;
@property NSNumber *numero;
@property NSNumber *ano;

@property NSString *ementa;
@property NSString *explicacaoEmenta;

@property NSNumber *qtdeAutores;

@property NSNumber *idAutor;


@end
