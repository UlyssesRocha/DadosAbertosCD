//
//  CDDeputado.m
//  DadosAbertosDeputados
//
//  Created by Ulysses on 3/10/16.
//  Copyright © 2016 DadosAbertosBrasil. All rights reserved.
//

#import "CDDeputado.h"
#import "CDURLManager.h"
#import "XMLReader.h"
#import "AFNetworking.h"

@implementation CDDeputado

+ (void)loadDeputados:(void(^)(NSArray* response))completionHandler{
    
    if (completionHandler == NULL) {
        return;
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[CDURLManager obterDeputados]]];
    
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
        //Parse from Dictionary for CDDeputado Object
        NSArray *test = [[[[xmlDictionary allValues] objectAtIndex:0] allValues] objectAtIndex:0];
        NSMutableArray *responseArray = [[NSMutableArray alloc]init];
        
        //Initiate each CDDeputado Object
        for (id currentMember in test){
            CDDeputado *currentDeputado = [[CDDeputado alloc]initWithBasicInfoDictionary:currentMember];
            if (currentDeputado){
                [responseArray addObject:currentDeputado];
            }
        }
        completionHandler(responseArray);
    }];
    
    [task resume];
    
}


- (instancetype) initWithBasicInfoDictionary:(NSDictionary*)dictionary{
    self = [super init];
    if(self) {
        @try {
            self.nomeParlamentar = [[dictionary valueForKey:@"nomeParlamentar"]valueForKey:@"text"];
            self.fone = [[dictionary valueForKey:@"fone"]valueForKey:@"text"];
            self.urlFoto = [[dictionary valueForKey:@"urlFoto"]valueForKey:@"text"];
            self.ideCadastro = [[dictionary valueForKey:@"ideCadastro"]valueForKey:@"text"];
            self.partido = [[dictionary valueForKey:@"partido"]valueForKey:@"text"];
            self.matricula = [[dictionary valueForKey:@"matricula"]valueForKey:@"text"];
            self.nome = [[dictionary valueForKey:@"nome"]valueForKey:@"text"];
            self.idParlamentar = [[dictionary valueForKey:@"idParlamentar"]valueForKey:@"text"];
            self.uf = [[dictionary valueForKey:@"uf"]valueForKey:@"text"];
            self.condicao = [[dictionary valueForKey:@"condicao"]valueForKey:@"text"];
            self.email = [[dictionary valueForKey:@"email"]valueForKey:@"text"];
        }
        @catch (NSException *exception) {
            return NULL;
        }
    }
    return self;
}





@end
