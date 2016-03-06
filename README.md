# DadosAbertosCD
Métodos para consumir dados do Web Service de dados abertos da Camara dos deputados iOS


Para utilizar, basta importar os arquivos URLManager.h e URLManager.m para o projeto, cada funcao descreve uma possivel busca no webservice da Camara dos Deputados.

Após feito o request, é necessario tratar o XML, o projeto contem XMLDictionary 1.4, com isso é capaz transfomar o XML de retorno em NSDictionary.

Exemplo para obter todos os partidos presentes na Camara: (Valores opcionais podem ser preenchidos com uma string vazia "").

    NSData *partidosPorBloco = [NSData dataWithContentsOfURL:[NSURL URLWithString: [URLManager obterPartidosBlocoCDPorID:@"" comNumLegislatura:@""]]];
    NSDictionary *dic = [NSDictionary dictionaryWithXMLData:partidosPorBloco];
    NSLog(@"%@",dic);

