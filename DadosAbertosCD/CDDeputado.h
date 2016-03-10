//
//  CDDeputado.h
//  DadosAbertosDeputados
//
//  Created by Ulysses on 3/10/16.
//  Copyright © 2016 DadosAbertosBrasil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDDeputado : NSObject

#pragma mark Basic Information
@property NSNumber *ideCadastro;
@property NSNumber *matricula;
@property NSNumber *idParlamentar;

@property NSString *condicao;
@property NSString *nome;
@property NSString *nomeParlamentar;
@property NSString *urlFoto;

@property NSString *partido;

@property NSString *gabinete;
@property NSString *anexo;

//Contacts
@property NSString *uf;
@property NSString *fone;
@property NSString *email;

#pragma mark Details
@property NSDate *dataNascimento;
@property NSString *situacaoNaLegislaturaAtual;
@property NSString *ufRepresentacaoAtual;
@property NSString *nomeProfissao;


@end
