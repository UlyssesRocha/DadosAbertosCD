//
//  URLManager.m
//  DadosAbertosDeputados
//
//  Created by Ulysses on 3/3/16.
//  Copyright © 2016 DadosAbertosBrasil. All rights reserved.
//

#import "URLManager.h"

@implementation URLManager

#pragma mark Deputados
+ (NSString*)obterDeputados{
    return @"http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados";
}

+ (NSString*)obterDetalhesDeputadoPorID:(NSString*)ideCadastro comNumLegislatura:(NSString*)numLegislatura{
    return [NSString stringWithFormat:@("http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDetalhesDeputado?ideCadastro=%@&numLegislatura=%@"),ideCadastro,numLegislatura];
}

+ (NSString*)obterLideresBancadas{
    return @"http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterLideresBancadas";
}

+ (NSString*)obterPartidosCD{
    return @"http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterPartidosCD";
}

+ (NSString*)obterPartidosBlocoCDPorID:(NSString*)idBloco comNumLegislatura:(NSString*)numLegislatura{
    return [NSString stringWithFormat:@("http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterPartidosBlocoCD?numLegislatura=%@&idBloco=%@"),idBloco,numLegislatura];
}

#pragma mark Orgaos

+ (NSString*)listarCargosOrgaosLegislativosCD{
    return @"http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ListarCargosOrgaosLegislativosCD";
}

+ (NSString*)listarTiposOrgao{
    return @"http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ListarTiposOrgaos";
}

+ (NSString*)obterAndamentoPorSigla:(NSString*)sigla comNumero:(NSString*)numero doAno:(NSString*)ano aPartirDaData:(NSString*)dataIni comIDOrgao:(NSString*)codOrgao{
    return [NSString stringWithFormat:@("http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ObterAndamento?sigla=%@&numero=%@&ano=%@&dataIni=%@&codOrgao=%@"),sigla,numero,ano,dataIni,codOrgao];
}

+ (NSString*)obterEmendasSubstitutivoRedacaoFinalPorTipo:(NSString*)tipo comNumero:(NSString*)numero doAno:(NSString*)ano{
    return [NSString stringWithFormat:@("http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ObterEmendasSubstitutivoRedacaoFinal?tipo=%@&numero=%@&ano=%@"),tipo,numero,ano];
}

+ (NSString*)obterIntegraComissoesRelatorPorTipo:(NSString*)tipo comNumero:(NSString*)numero doAno:(NSString*)ano{
    return [NSString stringWithFormat:@("http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ObterIntegraComissoesRelator?tipo=%@&numero=%@&ano=%@"),tipo,numero,ano];
}

+(NSString*)obterMembrosOrgaoPorID:(NSString*)idOrgao{
    return [NSString stringWithFormat:@("http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ObterMembrosOrgao?IDOrgao=%@"),idOrgao];
}

+ (NSString*)obterOrgaos{
    return [NSString stringWithFormat:@"http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ObterOrgaos"];
}

+ (NSString*)obterPautaPorID:(NSString*)idOrgao deDataIni:(NSString*)datIni ateDataFim:(NSString*)datFim{
    return [NSString stringWithFormat:@("http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ObterPauta?IDOrgao=%@&datIni=%@&datFim=%@"),idOrgao,datIni,datFim];
}


+ (NSString*)obterRegimeTramitacaoDespachoPorTipo:(NSString*)tipo comNumero:(NSString*)numero noAno:(NSString*)ano{
    return [NSString stringWithFormat:@("http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ObterRegimeTramitacaoDespacho?tipo=%@&numero=%@&ano=%@"),tipo,numero,ano];

}


@end
