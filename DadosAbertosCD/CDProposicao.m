//
//  CDProposicao.m
//  DadosAbertosDeputados
//
//  Created by Ulysses on 3/10/16.
//  Copyright © 2016 DadosAbertosBrasil. All rights reserved.
//

#import "CDProposicao.h"
#import "AFNetworking.h"
#import "CDURLManager.h"
#import "XMLReader.h"


@interface CDProposicao () //note the empty category name
- (void)loadFromServer:(void(^)(NSDictionary* response))completionHandler;
@end

@implementation CDProposicao

- (instancetype)initWithCodProposicao:(NSNumber*)codProposicao{
    self = [super init];
    if(self) {
        self.idProposicao = codProposicao;
    }
    return self;
}

-(void)loadPreposicao:(void(^)(void))completionHandler{
    [self loadFromServer:^(NSDictionary *response) {
        if (response){
            //Number Formatter to convert String to Number.
            NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
            formater.numberStyle = NSNumberFormatterDecimalStyle;
            
            self.nome = [[response objectForKey:@"nomeProposicao"] objectForKey:@"text"];
            
            self.sigla = [[response objectForKey:@"tipo"] stringByReplacingOccurrencesOfString:@" " withString:@""]; //remove space
            self.numero = [formater numberFromString:[response objectForKey:@"numero"]];
            self.ano = [formater numberFromString:[response objectForKey:@"ano"]];
            
            self.tipoProposicao = [[response objectForKey:@"tipoProposicao"] objectForKey:@"text"];
            self.tema  = [[response objectForKey:@"tema"] objectForKey:@"text"];
            self.ementa = [[response objectForKey:@"Ementa"] objectForKey:@"text"];
            self.explicacaoEmenta = [[response objectForKey:@"ExplicacaoEmenta"] objectForKey:@"text"];
            self.indexacao = [[response objectForKey:@"Indexacao"] objectForKey:@"text"];
            
            self.regimeTramitacao = [[response objectForKey:@"RegimeTramitacao"] objectForKey:@"text"];
            self.situacao = [[response objectForKey:@"Situacao"] objectForKey:@"text"];
            
            self.urlInteiroTeor = [[response objectForKey:@"LinkInteiroTeor"] objectForKey:@"text"];
            
            self.idAutor = [[response objectForKey:@"ideCadastro"] objectForKey:@"text"];
            
            completionHandler();
        }
    }];
}

- (void)loadFromServer:(void(^)(NSDictionary* response))completionHandler{
    
    if ( self.idProposicao == NULL || completionHandler == NULL) {
        return;
    }
    
    NSString * codProposicao = [NSString stringWithFormat:@"%@", self.idProposicao];
    NSURL * urlRequest = [NSURL URLWithString:[CDURLManager obterProposicaoPorID:codProposicao]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlRequest];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =  [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/xml"];
    
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        //Parse XML Data to Dictionary
        NSError *parseError = nil;
        NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLData:responseObject error:&parseError];
        if (parseError != NULL) {
            return;
        }
        
        //Isolate the dictionary
        NSDictionary *contentDictionary = [[xmlDictionary allValues] objectAtIndex:0];
        
        completionHandler(contentDictionary);
    }];
    
    [task resume];
}

@end
