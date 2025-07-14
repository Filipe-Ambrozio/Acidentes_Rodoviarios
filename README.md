-  INTRODUÇÃO

A crescente preocupação com a segurança nas rodovias brasileiras tem motivado a Polícia Rodoviária Federal (PRF)
a buscar soluções mais eficazes para a redução de acidentes e de suas consequências. Neste contexto, a análise de
dados surge como ferramenta essencial para compreender os fatores que contribuem para a ocorrência e gravidade dos acidentes.
Este relatório apresenta uma análise exploratória desenvolvido com a ferramenta RStudio, baseada em dados detalhados de acidentes rodoviários,
com o objetivo de identificar causas recorrentes, avaliar a influência das condições meteorológicas,
entender o impacto do número de veículos envolvidos e propor recomendações práticas para campanhas educativas.
A abordagem utiliza técnicas estatísticas, análise de texto e boas práticas de proteção de dados sensíveis,
contribuindo para o desenvolvimento de políticas públicas mais precisas e preventivas.

-  	ANÁLISE DESCRITIVA DOS DADOS

Nosso desafio central é identificar e mitigar as causas subjacentes aos acidentes de trânsito.
Para isso, analisamos um conjunto de dados com o objetivo de desenvolver métodos e estratégias eficazes para reduzir esses números,
promovendo maior segurança e aprimorando as condições de mobilidade urbana.

2.1 CALCULANDO A FREQUÊNCIA DE CADA TIPO DE ACIDENTE.
  
  Inicialmente, buscamos identificar os tipos de acidentes com maior ocorrência e sua relação com a probabilidade de fatalidade. Os dados revelam que a colisão traseira é o tipo de acidente mais frequente, totalizando 11.638 registros e representando aproximadamente 19% do total de acidentes.	Ao calcular a proporção de acidentes com vítimas fatais por tipo, a colisão frontal se destaca com a maior probabilidade de fatalidade, atingindo cerca de 30%. Isso representa um alerta significativo para a segurança viária. O atropelamento de pedestre também se mostra preocupante, com um total de 2.661 registros, dos quais 784 resultaram em vítimas fatais. 

<img width="869" height="541" alt="image" src="https://github.com/user-attachments/assets/92e150b6-d188-45fa-9f52-df1a20a6d1f3" />

Os resultados da classificação de acidentes indicam que há uma probabilidade de 7,12% de um acidente resultar em fatalidade.
Embora a colisão traseira seja o tipo mais comum (19% de frequência), sua probabilidade de fatalidade
(aproximadamente 4% quando observamos a tabela detalhada) é consideravelmente menor em comparação
com a colisão frontal e o atropelamento de pedestre, que, apesar de terem menor frequência geral, apresentam maiores chances de serem fatais. 

2.2	CLASSIFICAÇÃO DE ACIDENTES E CONDIÇÕES METEREOLOGICA

Vítimas fatais compõe 7,12% do acidentes registrados somando um total de 4297,
apesar de estar na última colocação não podemos descarta que é uma indicador muito alarmante.
Vamos destrinchar, e acha o que mais impactar encima dessa informação encontrada.
Podemos fazer um analise nas variavez como qual tipo de pista especificar  e tipo de acidente mais recorrente.

<img width="836" height="271" alt="image" src="https://github.com/user-attachments/assets/c3a64e22-12cd-4dfa-891b-322178fcd9fe" />

Vamos fazer uma análise mais a fundo, como as condições meteorológica pode influência esse valor.

A tabela seguinte ilustra a distribuição dos acidentes segundo as condições meteorológicas e a classificação de gravidade.
 
<img width="797" height="553" alt="image" src="https://github.com/user-attachments/assets/d55b9fdc-7033-4984-85e1-eb49e69cf7b7" />

As dez primeiras linhas da tabela ilustram a distribuição das ocorrências de acidentes de trânsito sob diferentes condições meteorológicas. Observa-se uma concentração significativa de acidentes em dias de céu claro, que apresenta os maiores números em todas as classificações: 30.105 acidentes com vítimas feridas, 6.314 sem vítimas e 2.913 com vítimas fatais.

3	IDENTIFICANDO PADRÕES.

Número de ocorrências, com 46.299 acidentes com vítimas feridas e 4.297 com vítimas fatais. Buscamos agora informações mais detalhadas, realizando uma verificação nas condições meteorológicas com foco na proporção de acidentes fatais em relação ao total de ocorrências para cada condição.

3.1	PROPORÇÃO DA GRAVIDADE DOS ACIDENTES POR CONDIÇÃO METEOROLÓGICA.

<img width="869" height="469" alt="image" src="https://github.com/user-attachments/assets/ccb22002-97b7-4645-b692-5d819892c30c" />

 A distribuição da proporção da gravidade dos acidentes por condição meteorológica é demonstrada no gráfico, revelando os índices mais preocupantes em vermelho, auxiliando na compreensão e identificação de áreas que demandam maior investigação. 

A tabela a seguir detalha o número total de acidentes e a proporção de cada tipo (aparentemente, apenas "Com Vítimas Feridas" e "Com Vítimas Fatais" estão representados nesta extração) para diferentes condições meteorológicas.

 <img width="945" height="377" alt="image" src="https://github.com/user-attachments/assets/f0922dbc-fb23-47bb-b598-6c96b14de414" />

Análisando a proporção de acidentes com vítimas feridas, observamos que dias de sol apresentam uma proporção de aproximadamente 81%, seguidos por dias nublados com cerca de 77% e dias de céu claro com uma proporção também elevada. Isso indica condições meteorológicas com maior propensão a acidentes fatais, considerando essa métrica.
Dando continuidade à análise, buscaremos identificar o fator mais alarmante relacionado aos acidentes fatais dentro dessa mesma dinâmica. 

 <img width="945" height="406" alt="image" src="https://github.com/user-attachments/assets/e62b4c73-1739-4e0a-b01f-1de4743b6d56" />

 Análisando especificamente os acidentes com vítimas fatais, as condições meteorológicas com nevoeiro e neblina apresentam uma proporção de quase 10%, liderando esta análise. O céu claro também registra um número significativo de acidentes fatais, com 2.913 ocorrências denominado tempo seco, representando 7,4%. Esses dados sugerem que condições de visibilidade reduzida, como nevoeiro e neblina, podem estar fortemente associadas a um maior risco de fatalidade em acidentes.

3.2	PERIODO POR HORA DE ACIDESTE FATAIS.

No grafico abaixo mostra a distribuição por horas das quantidade total de acidentes.

 <img width="945" height="505" alt="image" src="https://github.com/user-attachments/assets/183977ee-cbd8-4175-bcc4-9c8bf71a59db" />

Os maiores registros de acidentes se acentuam no intervalo de 17h às 19h, com um pico notável às 18h, e outro pico, embora menor, por volta das 7h. Vamos explorar essas partes mais a fundo e buscar possíveis causas para essa distribuição.
A proporção vai mostrar um campo de visão mais assertivo onde queremos chegar, onde está a zona de acidentes fatais em questão de horário de pico com mais ocorrências. 
O pico de acidentes no final da tarde, especialmente às 18h, pode ser atribuído a diversos fatores como muitas pessoas estão voltando para casa do trabalho ou da escola, resultando em um aumento significativo no volume de veículos nas vias.
Condutores podem estar mais cansados após um dia de trabalho, o que pode levar a lapsos de atenção e erros.
A pressa para chegar em casa pode levar a comportamentos de risco, como excesso de velocidade ou desrespeito às leis de trânsito.
Condições de iluminação: Dependendo da época do ano, o final da tarde pode coincidir com o pôr do sol, causando ofuscamento e dificultando a visibilidade.
O pico de acidentes por volta das 7h também pode ser explicado pelo aumento do fluxo de veículos devido ao deslocamento para o trabalho e escolas. A pressa matinal e a possível sonolência também podem contribuir para um maior número de acidentes.

<img width="945" height="512" alt="image" src="https://github.com/user-attachments/assets/c6dc180b-9c3d-4fb7-97d9-19ac81a85c17" /> 

O gráfico acima apresenta a variação da proporção de diferentes classificações de acidentes ao longo do dia, com o eixo horizontal representando as horas do dia (de 0 a 23) e o eixo vertical representando a proporção de acidentes.

Com Vítimas Fatais (linha verde): A maior ocorrência de acidentes com vítimas fatais parece se concentrar no final da tarde e início da noite, com um pico por volta das 18h e 19h. Observa-se um segundo pico, menor, no início da manhã, por volta das 6h e 7h.

Com Vítimas Feridas (linha laranja): A maior ocorrência de acidentes com vítimas feridas apresenta dois picos bem definidos: um no final da tarde e início da noite, com o pico mais alto por volta das 17h e 18h, e outro no início da manhã, com um pico significativo por volta das 7h e 8h.

Sem Vítimas (linha azul): A maior ocorrência de acidentes sem vítimas parece ser mais distribuída ao longo do dia, com um pico mais pronunciado no final da tarde e início da noite, por volta das 18h e 19h. Há também um aumento considerável durante o dia, especialmente entre as 10h e 16h.

Para obter uma compreensão mais aprofundada, investigamos o total de acidentes fatais e sua proporção ao longo das diferentes horas do dia, buscando identificar padrões e, se possível, acessar informações mais detalhadas sobre esses eventos.

<img width="480" height="365" alt="image" src="https://github.com/user-attachments/assets/33989274-71f6-4e66-8d04-960482ab3e43" /> 

Segundo Pico no Final da Tarde (18h30 e 18h): Os horários das 18h30 (67 acidentes fatais, 1.56%) e 18h (48 acidentes fatais, 1.12%) também apresentam um número elevado de fatalidades, consolidando a faixa entre o final da tarde e o início da noite como o período mais perigoso. 
Início da Noite (19h30 e 20h): A tendência de alta fatalidade se estende para o início da noite, com 19h30 (58 acidentes fatais, 1.35%) e 20h (56 acidentes fatais, 1.30%) figurando entre os horários com mais ocorrências. 
Madrugada (5h): Interessantemente, o horário das 5h da manhã aparece como um dos com maior número de acidentes fatais (49, 1.14%), sugerindo que fatores como fadiga, menor visibilidade (dependendo da época do ano e iluminação da via) ou outros comportamentos de risco podem ser relevantes nesse período.

<img width="824" height="446" alt="image" src="https://github.com/user-attachments/assets/9a216f43-fe39-4cf3-9298-1dba7d9ad961" /> 

Embora o número total seja importante, a coluna de "proporção" indica a relevância relativa de cada horário no total de acidentes fatais. O horário das 19h, com a maior proporção, deve ser prioritário nas ações de prevenção.

3.3	TIPOS DE ACIDENTES POR PICO DE 18H19H.

Vendo que nesse intervalo está mais fixado o pico desse incidentes graves, agora vamos busca as causas que acarreta e eleva esse indicativos.

<img width="945" height="625" alt="image" src="https://github.com/user-attachments/assets/2b024b80-85a4-4d12-86cf-67944bcc3bf0" /> 

A colisão se destaca como a principal causa de acidentes fatais no horário de pico entre 18h e 19h. Em particular, as colisões frontais representam um alerta significativo dentro desse cenário. Surpreendentemente, o atropelamento de pedestres também figura como uma das ocorrências mais frequentes nesse intervalo de tempo, ocupando a primeira posição em número de casos fatais. Após o atropelamento de pedestres e as colisões (frontal e traseira), observam-se também ocorrências de saída de leito carroçável e tombamento, embora em menor frequência.

Essa alta incidência de atropelamentos no horário de pico pode indicar a necessidade de reforçar a sinalização, a iluminação e a fiscalização em áreas de grande circulação de pedestres durante esse período crítico. A frequência de colisões frontais, por sua vez, pode sugerir a importância de campanhas de conscientização sobre ultrapassagens seguras e o respeito às normas de trânsito, visando reduzir a gravidade dos acidentes.

A análise da distribuição dos acidentes por tipo de pista revela padrões distintos em relação à gravidade. Em termos de número absoluto de ocorrências, a pista Simples concentra a maior quantidade de acidentes em todas as classificações: com vítimas

3.4	TIPOS DE PISTA E SUA PROPORÇÃO.

<img width="945" height="511" alt="image" src="https://github.com/user-attachments/assets/ac19a257-c9ea-41ae-8d5a-93adaeba3ab3" /> 

Classificando os acidentes em feridas, sem vítimas e com vítimas fatais. As pistas Dupla e Múltipla apresentam um número menor de casos, respectivamente para casos fatais.
Vítimas fatais tem uma maior concentração em vias simples como demostra no gráfico acima.

<img width="819" height="578" alt="image" src="https://github.com/user-attachments/assets/c1c16bea-0cce-421f-8cbb-7aa4af077a44" />
 
Ao focarmos especificamente nos acidentes fatais durante o horário de pico (18h-19h), o gráfico de "Causas de Acidentes Fatais no Pico (18h-19h)" reforça a tendência observada na tabela. A pista Simples registra um número significativamente maior de acidentes fatais nesse período em comparação com as pistas Dupla e Múltipla.
Essa disparidade sugere que as características das pistas simples, como mão dupla sem separação física, curvas mais acentuadas, menor infraestrutura de segurança e, potencialmente, maior interação entre diferentes tipos de veículos e pedestres, podem contribuir para uma maior ocorrência de acidentes fatais no horário de pico. Por outro lado, pistas duplas e múltiplas, com separação de faixas e maior controle de acesso, parecem estar associadas a um menor número de fatalidades nesse intervalo de tempo.
Essa informação é crucial para direcionar esforços de segurança viária, priorizando intervenções e fiscalização em pistas simples durante os horários de maior risco, como o pico da noite. Investigações adicionais poderiam explorar os tipos específicos de acidentes fatais mais comuns em pistas simples nesse período para identificar medidas preventivas mais eficazes.

<img width="845" height="458" alt="image" src="https://github.com/user-attachments/assets/51386658-3864-4bd8-8157-6911bb9e3c13" />
 
A pista de tipo simples é apontada com mais ocorrência do que as demais. A análise reforça a maior vulnerabilidade das pistas simples em relação a acidentes fatais, especialmente durante o horário de pico. As características dessas vias, como a ausência de separação física entre os sentidos do tráfego, aumentam o risco de colisões frontais, que são frequentemente graves. A menor infraestrutura de segurança também contribui para essa maior letalidade. Abaixo um demonstrativo de quantidades de veículos foram envolvidos nessa categoria de vias.

<img width="845" height="606" alt="image" src="https://github.com/user-attachments/assets/cdb0c4a1-6240-41c4-a197-6cbe27f6392f" />

<img width="843" height="571" alt="image" src="https://github.com/user-attachments/assets/86e11f73-c61f-4b15-991e-1ea201894778" />

Plena noite em vias simples  no período de 18horas seria uma horário de pico de maior fluxo de veículos e de perdestes nas vias levando a um grande número de acidentes..
No gráfico abaixo mostra algumas causas nesses intervalos de horário sempre visando a classificar com vítimas fatais, podemos resumir que fica mais evidente que acidentes fatais gira em torno de 18 a 19 horas em vias simples e no período da plena noite, os tipos mais comuns de acidentes fica com colisão frontal, traseira e transversal, atropelamento de pedestre também é mencionado, buscado causas acidentes por pico de 18h19h.
Predominância da Plena Noite: O gráfico reforça a informação anterior de que a plena noite é o período com o maior número de acidentes fatais no pico das 18h-19h em vias simples. A drástica redução da visibilidade durante a noite, combinada com as características de pistas simples (ausência de separação física, menor infraestrutura), cria um cenário de alto risco.

Relevância do Anoitecer: O anoitecer também se destaca com um número significativo de acidentes fatais nesse horário de pico. A transição da luz do dia para a escuridão pode ser um período crítico, com a visibilidade diminuindo gradualmente e os condutores precisando se adaptar às novas condições.

Agora verificamos as causas mais comuns nesse mesmo período que causa mais fatalidade.

 <img width="945" height="512" alt="image" src="https://github.com/user-attachments/assets/5e3f0459-d20a-4b36-9101-99cd0b6dde61" />

Tipos de Acidentes Fatais Comuns: A menção aos tipos de acidentes fatais mais comuns nesse cenário (colisão frontal, traseira e transversal, atropelamento de pedestre) sugere que a combinação de tráfego intenso, baixa visibilidade e as características das pistas simples favorecem esses tipos de ocorrências graves.
Colisões Frontais: A ausência de separação física em pistas simples aumenta o risco de colisões frontais, especialmente em ultrapassagens mal sucedidas ou desatenção.
Colisões Traseiras: O tráfego lento e as paradas repentinas comuns em horários de pico, combinados com a visibilidade reduzida à noite, podem levar a colisões traseiras.
Colisões Transversais: Interseções mal sinalizadas ou com visibilidade comprometida à noite em pistas simples podem aumentar o risco de colisões transversais.
Atropelamento de Pedestres: A baixa visibilidade noturna em pistas simples, muitas vezes com acostamentos precários ou inexistentes e iluminação inadequada, expõe os pedestres a um alto risco de atropelamento.

<img width="945" height="512" alt="image" src="https://github.com/user-attachments/assets/251fbda2-1983-4672-83ae-f0c548acf21f" />
 
Retas compõem 62% da ocorrência fatais e mostram que vias simples têm maior incidência de acidentes fatais nesse período, possivelmente negligência ao acessar a via sem ter devido cuidados ou ingestão de bebidas alcoólicas, imperícias como falta de reação assertiva e imprudências como ultrapassagem indevida ou velocidade incompatível com a via.
Predomínio das Retas: As retas lideram significativamente o número de acidentes fatais no pico das 18h-19h, representando 62% das ocorrências. Isso pode parecer contra intuitivo, já que curvas são geralmente associadas a maior risco. No entanto, em retas, a alta velocidade, a desatenção, o sono e as manobras de ultrapassagem indevida se tornam fatores de risco mais proeminentes. A sensação de segurança em um trecho reto e com boa visibilidade pode levar a comportamentos mais arriscados.
Relevância das Curvas: As curvas aparecem em segundo lugar, indicando que a geometria da via ainda é um fator importante na ocorrência de acidentes fatais, especialmente em um horário de tráfego intenso e possível redução da visibilidade.
Influência da Topografia: Declives e rampas também contribuem para o número de acidentes fatais, sugerindo que a inclinação da via pode influenciar a velocidade dos veículos e a capacidade de frenagem, especialmente em condições de tráfego congestionado ou em situações de emergência.
Complexidade das Interseções: A presença de "Reta Interseção de Vias" na lista, embora com menor número de ocorrências, destaca a periculosidade desses pontos de conflito de tráfego, especialmente durante o horário de pico.
Fatores Comportamentais: A menção de negligência, ingestão de álcool, imperícia e imprudência (ultrapassagem indevida e velocidade incompatível) como possíveis causas associadas aos acidentes em retas reforça a importância do fator humano na segurança viária.

3.5	CAUSAS E PLANO DE AÇÃO.

A análise detalhada dos acidentes de trânsito revela padrões cruciais que direcionam a necessidade de ações estratégicas para a redução de fatalidades. Os principais padrões identificados apontam para a vulnerabilidade das pistas simples, especialmente durante a noite e nos horários de pico (18h-19h), como cenários de alto risco. As condições meteorológicas de baixa visibilidade, como nevoeiro/neblina, e trechos de retas, onde a velocidade excessiva e a desatenção se tornam mais perigosas, também se destacam. Os tipos de acidentes fatais mais comuns incluem atropelamentos de pedestres, colisões frontais, traseiras e transversais.
Os principais fatores de risco identificados sublinham a complexa interação entre a infraestrutura viária (pistas simples), as condições ambientais (baixa visibilidade), o comportamento humano (velocidade excessiva, desatenção, negligência, ingestão de álcool) e os horários de maior fluxo de veículos e pedestres.
Para mitigar esses riscos, propomos recomendações práticas que abrangem tanto a conscientização quanto as intervenções nas vias. Campanhas educativas direcionadas para os horários e locais de maior risco, com mensagens específicas sobre os perigos das pistas simples à noite, os riscos em retas e a importância da segurança para pedestres e em condições adversas, são essenciais. Paralelamente, ações preventivas nas vias, como a priorização de melhorias em pistas simples (duplicação, sinalização, iluminação), a implementação de redutores de velocidade em áreas críticas e a otimização da infraestrutura para pedestres, são cruciais para criar um ambiente viário mais seguro.

Ações como:
•	Fiscalização Intensificada: Aumentar a presença de agentes de trânsito e realizar blitzes (incluindo alcoolemia) nos horários e locais de maior risco.
•	Campanhas de Conscientização: Desenvolver campanhas educativas focadas nos perigos da direção sob efeito de álcool, excesso de velocidade e respeito às leis de trânsito, intensificando-as nos horários críticos.
•	Melhorias na Infraestrutura: Otimizar a sinalização, instalar dispositivos de segurança (radares, lombadas), melhorar a iluminação e criar faixas de pedestres seguras.
•	Parcerias com Estabelecimentos: Colaborar com bares e restaurantes para promover o consumo responsável e oferecer alternativas de transporte seguro.
•	Educação para o Trânsito: Implementar programas educativos nas escolas e comunidades para sensibilizar a população.
•	Análise Contínua de Dados: Monitorar os dados de acidentes para ajustar as estratégias de prevenção de forma eficaz.

A implementação eficaz dessas ações depende fundamentalmente da garantia da privacidade e segurança da base de dados utilizada na análise. A proteção de dados sensíveis, como a localização exata dos acidentes (latitude/longitude) e outras informações potencialmente identificáveis, é primordial. Para isso, medidas rigorosas de anonimização e desidentificação devem ser aplicadas antes da análise, agregando dados em níveis geográficos menos granulares (por município ou bairro, por exemplo) e removendo identificadores diretos. O acesso à base de dados deve ser estritamente controlado, utilizando criptografia para proteger os dados armazenados e em trânsito. Políticas claras de retenção e descarte seguro dos dados, juntamente com o treinamento da equipe em práticas de segurança da informação e a conformidade com as regulamentações de proteção de dados (como a LGPD), são indispensáveis para garantir a confidencialidade e a integridade das informações, construindo assim uma base confiável para aprimorar a segurança viária.

- CONCLUSÃO

A elaboração deste projeto, utilizando a robusta ferramenta RStudio, demonstrou o imenso potencial da análise de dados para a compreensão aprofundada dos complexos padrões que permeiam os acidentes de trânsito. Ao identificar as condições mais críticas – como as pistas simples durante a noite e os horários de pico – e os fatores de risco predominantes, pudemos transcender a mera descrição estatística e gerar insights acionáveis.
A capacidade do RStudio de manipular grandes volumes de dados, calcular proporções relevantes e gerar visualizações claras foi fundamental para desvendar as nuances da segurança viária em nosso contexto. Essa jornada analítica não apenas aprimorou nossa compreensão do problema, mas também nos capacitou a formular recomendações práticas e direcionadas. As sugestões de ajustes em campanhas de conscientização e as propostas de ações preventivas nas vias emergem diretamente dos padrões identificados, oferecendo um caminho concreto para a redução de acidentes e, principalmente, de fatalidades.
Além do valor técnico e analítico, este projeto representa uma significativa contribuição para a cidadania. Ao lançar luz sobre os pontos críticos e propor soluções embasadas em dados, buscamos influenciar positivamente as políticas públicas e as decisões dos gestores responsáveis pela segurança viária. Acreditamos que a informação precisa e acessível é um poderoso motor para a mudança social, permitindo que ações preventivas sejam implementadas de forma mais eficaz e que a conscientização da população seja mais impactante.
Em suma, a utilização do RStudio neste projeto não se limitou à análise estatística; ela se traduziu em um exercício de cidadania ativa, onde o conhecimento gerado a partir dos dados se torna um instrumento para a construção de um trânsito mais seguro e para a preservação de vidas. Acreditamos que essa abordagem, que alia o rigor da análise de dados ao compromisso com o bem-estar coletivo, pode servir de modelo para futuras iniciativas em diversas áreas da sociedade.
