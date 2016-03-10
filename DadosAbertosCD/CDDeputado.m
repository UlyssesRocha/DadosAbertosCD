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

@implementation CDDeputado

+ (void)loadDeputados{
    
    NSString *adress = [CDURLManager obterDeputados];
    
    NSData *deputados = [NSData dataWithContentsOfURL:[NSURL URLWithString: adress]];
    
    NSError *parseError = nil;
    
    NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLData:deputados error:NULL];
    
    NSLog(@" %@", xmlDictionary);
    
}

//let url = URLManager.obterPartidosCD()
//
//let partidos = NSData(contentsOfURL: NSURL(string: url)!)
//
//do{
//    
//    let dados = try AEXMLDocument(xmlData: partidos!)
//    if let partido = dados.root["partido"].all {
//        for sP in partido {
//            print(sP["idPartido"].stringValue)
//        }
//    }
//}catch{
//    
//}

@end
