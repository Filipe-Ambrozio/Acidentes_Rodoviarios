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



