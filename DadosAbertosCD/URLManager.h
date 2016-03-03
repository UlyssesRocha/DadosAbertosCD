//
//  URLManager.h
//  DadosAbertosDeputados
//
//  Created by Ulysses on 3/3/16.
//  Copyright © 2016 DadosAbertosBrasil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLManager : NSObject

#pragma mark Deputados

/**
 * Retorna os deputados em exercício na Câmara dos Deputados
 */
+ (NSString*)obterDeputados;

/**
 * Retorna detalhes dos deputados com histórico de participação em comissões,
 * períodos de exercício, filiações partidárias e lideranças, 
 * \param ideCadastro  (Obrigatorio) Identificador do deputado obtido na chamada ao ObterDeputados.
 * \param numero (Opcional) Número da legislatura. Campo vazio, todas as legislaturas do Deputado.
 */
+ (NSString*)obterDetalhesDeputadoPorID:(NSString*)ideCadastro comNumLegislatura:(NSString*)numLegislatura;

/**
 * Retorna os deputados líderes e vice-líderes em exercício das 
 *bancadas dos partidos
 */
+ (NSString*)obterLideresBancadas;

/**
 * Retorna os partidos com representação na Câmara dos Deputados
 */
+ (NSString*)obterPartidosCD;

/**
 * Retorna os blocos parlamentares na Câmara dos Deputados.
 * \param idBloco  (Opcional) ID do Bloco Parlamentar
 * \param numLegislatura (Opcional) Número da Legislatura. Campo Vazio, legislatura atual. Apenas legislatura 53 em diante.
 */
+ (NSString*)obterPartidosBlocoCDPorID:(NSString*)idBloco comNumLegislatura:(NSString*)numLegislatura;

#pragma mark Orgaos

/**
 * Retorna a lista dos tipos de cargo para os órgãos legislativos da 
 * Câmara dos Deputados (ex: presidente, primeiro-secretário, etc)
 */
+ (NSString*)listarCargosOrgaosLegislativosCD;

/**
 * Retorna a lista dos tipos de órgãos que participam do processo legislativo na Câmara dos Deputados
 */
+ (NSString*)listarTiposOrgao;

/**
 * Retorna o andamento de uma proposição pelos órgãos internos da Câmara a partir de uma data específica
 * \param sigla  (Obrigatorio) Sigla do tipo de proposição
 * \param numero (Obrigatorio) Numero da proposição
 * \param ano (Obrigatorio) Ano da proposição Formato
 * \param dataIni (Opcional)Data a partir da qual as tramitações do histórico de andamento serão retornadas (dd/mm/aaaa)
 * \param codOrgao (Opcional)ID do órgão numerador da proposição
 */
+ (NSString*)obterAndamentoPorSigla:(NSString*)sigla comNumero:(NSNumber*)numero doAno:(NSString*)ano aPartirDaData:(NSString*)dataIni comIDOrgao:(NSString*)codOrgao;

/**
 *Retorna as emendas, substitutivos e redações finais de uma determinada proposição
 * \param tipo  (Obrigatorio) Sigla do tipo de proposição
 * \param numero (Obrigatorio) Numero da proposição
 * \param ano (Obrigatorio) Ano da proposição Formato
 */
+ (NSString*)obterEmendasSubstitutivoRedacaoFinalPorTipo:(NSString*)tipo comNumero:(NSString*)numero doAno:(NSString*)ano;

/**
 *Retorna os dados de relatores e pareces, e o link para a íntegra de uma determinada proposição
 * \param tipo  (Obrigatorio) Sigla do tipo de proposição
 * \param numero (Obrigatorio) Numero da proposição
 * \param ano (Obrigatorio) Ano da proposição Formato
 */
+ (NSString*)obterIntegraComissoesRelatorPorTipo:(NSString*)tipo comNumero:(NSString*)numero doAno:(NSString*)ano;

/**
 * Retorna os parlamentares membros de uma determinada comissão
 * \param idOrgao (Obrigatorio) ID do órgão numerador da proposição
 */
+(NSString*)obterMembrosOrgaoPorID:(NSString*)idOrgao;

/**
 * Retorna a lista de órgãos legislativos da Câmara dos Deputados (comissões, Mesa Diretora, conselhos, etc.)
 */
+ (NSString*)obterOrgaos;

/**
 * Retorna as pautas das reuniões de comissões e das sessões plenárias realizadas em um determinado período
 * \param idOrgao  (Obrigatorio) ID do órgão (comissão) da Câmara dos Deputados
 * \param datIni (Opcional) O métoto retorna a pauta das reuniões que foram realizadas em uma data maior ou igual a datIni, formato dd/mm/aaaa
 * \param datFim (Opcional) O métoto retorna a pauta das reuniões que foram realizadas em uma data menor ou igual a datFim, formato dd/mm/aaaa
 */
+ (NSString*)obterPautaPorID:(NSString*)idOrgao deDataIni:(NSString*)datIni ateDataFim:(NSString*)datFim;

/**
 * Retorna as pautas das reuniões de comissões e das sessões plenárias realizadas em um determinado período
 * \param tipo  (Obrigatorio) Sigla do tipo de proposição
 * \param numero (Obrigatorio) Numero da proposição
 * \param ano (Obrigatorio) Ano da proposição
 */
+ (NSString*)obterRegimeTramitacaoDespachoPorTipo:(NSString*)tipo comNumero:(NSString*)numero noAno:(NSString*)ano;



@end
