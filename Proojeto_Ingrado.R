# Instalar os pacotes
install.packages("dplyr")
install.packages("ggplot2")
install.packages("scales")
install.packages("lubridate")
install.packages("readr")
install.packages("tidytext")
install.packages("stringr")
install.packages("stopwords")

#------------------------------- Carregar Bibliotecas, Conjutos de Dados.
library("dplyr")
library("ggplot2")
library("scales")
library("lubridate")
library("readr")
library("stopwords")

#Leitura de um arquivo CSV
dados <- read.csv("C:/Users/NICK-EIXO/Documents/DATA_SCIENCIS/3ºsemestre/1Probabilidade_Estatística_Para_Análise_Dados/datatran2024.csv",
                  fileEncoding = "ISO-8859-1",
                  sep =";", 
                  fill = TRUE, check.names = FALSE)

names(dados)

# ------------------- frequencia_acidentes
frequencia_acidentes <- dados %>%
  group_by(tipo_acidente) %>%
  summarise(frequencia = n()) %>%
  arrange(desc(frequencia))
print(frequencia_acidentes)

# tipo_acidente
numero_registros4 <- dados %>%
  group_by(tipo_acidente) %>%
  summarise(total_acidentes = n(),
            total_graves_fatais = sum(classificacao_acidente %in% c("Acidente Grave", "Com Vítimas Fatais")),
            proporcao_graves_fatais = (total_graves_fatais / total_acidentes) * 100) %>%
  mutate(probabilidade_total = total_acidentes / nrow(dados)) %>%
  arrange(desc(total_graves_fatais))

print("\nContagem de acidentes por fase do dia com classificação, proporção e probabilidade:")
print(numero_registros4)



# ------------------- classificacao_acidentes
numero_classificacao_acidente <- dados %>%
  group_by(classificacao_acidente) %>%
  summarise(total_acidentes = n()) %>%
  mutate(proporcao_percentual = (total_acidentes / nrow(dados)) * 100) %>%
  arrange(desc(proporcao_percentual))

print(numero_classificacao_acidente)

# ------------------- condições meteorológicas
resumo_clima_gravidade <- dados %>%
  group_by(condicao_metereologica, classificacao_acidente) %>%
  summarise(total = n()) %>%
  arrange(desc(total))
print(resumo_clima_gravidade)
#---------
proporcao_gravidade_clima <- resumo_clima_gravidade %>%
  group_by(condicao_metereologica) %>%
  mutate(proporcao = round((total / sum(total)) * 100, 2)) %>%
  arrange(desc(proporcao))

print(proporcao_gravidade_clima)
#gráfico
ggplot(proporcao_gravidade_clima, 
       aes(x = condicao_metereologica, 
           y = proporcao, 
           fill = classificacao_acidente)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Proporção da Gravidade dos Acidentes por Condição Meteorológica",
       x = "Condição Meteorológica",
       y = "Proporção (%)",
       fill = "Gravidade do Acidente") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))




# Gráfico
ggplot(proporcao_gravidade_clima, aes(x = condicao_metereologica, y = proporcao, fill = classificacao_acidente)) +
  geom_bar(stat = "identity", position = "fill") +
  labs(title = "Gravidade dos Acidentes por Condição Meteorológica",
       x = "Condição Meteorológica",
       y = "Proporção",
       fill = "Gravidade do Acidente") +
  theme_minimal() +
  coord_flip()

# ------------------- gravidade_por_horario
gravidade_por_horario <- dados %>%
  group_by(horario, classificacao_acidente) %>%
  summarise(total = n()) %>%
  mutate(proporcao = total / sum(total)) %>%
  arrange(desc(proporcao))
print(gravidade_por_horario)



# gravidade_fatal_por_horario
gravidade_fatal_por_horario <- dados %>%
  filter(classificacao_acidente == "Com Vítimas Fatais") %>%
  group_by(horario) %>%
  summarise(total = n(), .groups = "drop") %>%
  mutate(proporcao = total / sum(total)) %>%
  arrange(desc(proporcao))
print(gravidade_fatal_por_horario)
#Gráfico
# Selecionar os 10 horários com mais acidentes fatais
top10_fatais <- gravidade_fatal_por_horario %>% 
  slice_max(order_by = total, n = 10)

# Criar o gráfico
ggplot(top10_fatais, aes(x = reorder(horario, total), y = total)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Top 10 Horários com Mais Acidentes Fatais",
       x = "Horário",
       y = "Total de Acidentes Fatais") +
  theme_minimal() +
  coord_flip()


# ------------------- gravidade_por_pista
gravidade_por_pista <- dados %>%
  group_by(tipo_pista, classificacao_acidente) %>%
  summarise(total = n()) %>%
  mutate(proporcao = total / sum(total)) %>%
  arrange(desc(proporcao))
print(gravidade_por_pista)

ggplot(gravidade_por_pista, aes(x = tipo_pista, y = proporcao, fill = classificacao_acidente)) +
  geom_bar(stat = "identity", position = "fill") +
  labs(title = "Gravidade dos Acidentes por Tipo de Pista",
       x = "Tipo de Pista", y = "Proporção") +
  theme_minimal()

# ------------------- causas_fatais

causas_fatais <- dados %>%
  filter(classificacao_acidente == "Com Vítimas Fatais") %>%
  group_by(causa_acidente) %>%
  summarise(total = n()) %>%
  arrange(desc(total))

print(causas_fatais)

#**************************************************************
#*
#*
#*
#*

# condicao_metereologica
numero_registros6 <- dados %>%
  group_by(condicao_metereologica) %>%
  summarise(total_acidentes = n(),
            total_graves_fatais = sum(classificacao_acidente %in% c("Acidente Grave", "Com Vítimas Fatais")),
            proporcao_graves_fatais = (total_graves_fatais / total_acidentes) * 100) %>%
  mutate(probabilidade_total = total_acidentes / nrow(dados)) %>%
  arrange(desc(proporcao_graves_fatais))

print("\nContagem de acidentes por fase do dia com classificação, proporção e probabilidade:")
print(numero_registros6)

#**********************************************
#*
#*
# Frequência de cada tipo de acidente
freq_tipo_acidente <- dados %>%
  count(tipo_acidente, sort = TRUE)

# Proporção de acidentes fatais, feridos e sem vítimas
prop_classificacao <- dados %>%
  count(classificacao_acidente) %>%
  mutate(proporcao = n / sum(n))

# Gráfico
ggplot(prop_classificacao, aes(x = reorder(classificacao_acidente, n), y = n)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Frequência de classificação de Acidente", x = "classificaçãoo de Acidente", y = "Frequência")

print(freq_tipo_acidente)
print(prop_classificacao)

# ---------------2. Identificação de Padrões
# Condições Meteorológicas x Gravidade.

gravidade_vs_clima <- dados %>%
  group_by(condicao_metereologica, classificacao_acidente) %>%
  summarise(total = n()) %>%
  mutate(proporcao = total / sum(total))

ggplot(gravidade_vs_clima, aes(x = condicao_metereologica, y = proporcao, fill = classificacao_acidente)) +
  geom_bar(stat = "identity", position = "fill") +
  labs(title = "Gravidade x Condições Meteorológicas", y = "Proporção", x = "Clima") +
  coord_flip()

# novo grafico ------------------------
gravidade_vs_clima <- dados %>%
  group_by(condicao_metereologica, classificacao_acidente) %>%
  summarise(total = n()) %>%
  mutate(proporcao = total / sum(total))

ggplot(gravidade_vs_clima, aes(x = condicao_metereologica, y = proporcao, fill = classificacao_acidente)) +
  geom_bar(stat = "identity", position = "fill") +
  labs(title = "Gravidade x Condições Meteorológicas", y = "Proporção", x = "Clima") +
  coord_flip() +
  scale_fill_manual(values = c("Com Vítimas Fatais" = "red", # Mantendo vermelho para fatais
                               "Com Vítimas Feridas" = "blue",
                               "Sem Vítimas" = "grey",
                               "NA" = "darkgrey")) # Assumindo que pode haver uma categoria "NA"



# Carregar as bibliotecas necessárias
library(dplyr)
library(ggplot2)

# Supondo que seu dataset se chama 'acidentes' e já está carregado no RStudio
# Caso contrário, use a função de leitura apropriada, por exemplo:
# acidentes <- read.csv("seu_arquivo.csv")



# Tipo de pista
gravidade_vs_pista <- dados %>%
  group_by(tipo_pista, classificacao_acidente) %>%
  summarise(n = n()) %>%
  mutate(proporcao = n / sum(n))

ggplot(gravidade_vs_pista, aes(x = tipo_pista, y = proporcao, fill = classificacao_acidente)) +
  geom_bar(stat = "identity", position = "fill") +
  labs(title = "Gravidade por Tipo de Pista", x = "Tipo de Pista", y = "Proporção")

# ----------------3. Análise de Texto das Causas de Acidentes

library(tidytext)
library(stringr)
library(dplyr)

stop_words_pt <- stopwords("pt")  # 'pt' = português

causas_tokenizadas <- dados %>%
  select(causa_acidente, classificacao_acidente) %>%
  unnest_tokens(palavra, causa_acidente) %>%
  filter(!palavra %in% stop_words_pt) %>%
  count(classificacao_acidente, palavra, sort = TRUE) %>%
  filter(n > 20)


# Foco nas causas mais comuns de acidentes fatais
principais_causas_fatais <- dados %>%
  filter(classificacao_acidente == "Com Vítimas Fatais") %>%
  count(causa_acidente, sort = TRUE) %>%
  head(10)


# Extrai a hora da coluna "horario"
acidentes <- dados %>%
  mutate(hora = as.numeric(substr(horario, 1, 2))) %>%
  arrange(hora)

# Exibe as primeiras linhas dos dados organizados para verificar
head(acidentes)

# Conta o número de acidentes por hora
acidentes_por_hora <- acidentes %>%
  group_by(hora) %>%
  summarise(n_acidentes = n())

# Exibe o resultado da contagem
print(acidentes_por_hora)

# Cria o gráfico de barras
grafico_acidentes_hora <- ggplot(acidentes_por_hora, aes(x = hora, y = n_acidentes)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Número de Acidentes por Hora",
       x = "Hora do Dia",
       y = "Número de Acidentes") +
  scale_x_continuous(breaks = 0:23) + # Garante que todas as horas apareçam no eixo x
  theme_minimal()

# Exibe o gráfico
print(grafico_acidentes_hora)


##### Extrai a hora da coluna "horario"
# Extrai a hora da coluna "horario"
acidentes <- dados %>%
  mutate(hora = as.numeric(substr(horario, 1, 2)))

# Conta o número total de acidentes
total_acidentes <- nrow(acidentes)

# Calcula o número de acidentes por hora e classificação
acidentes_por_hora_classificacao <- acidentes %>%
  group_by(hora, classificacao_acidente) %>%
  summarise(n_acidentes = n(), .groups = 'drop') %>%
  mutate(proporcao = n_acidentes / total_acidentes)

# Exibe o resultado com as proporções por hora e classificação
print(acidentes_por_hora_classificacao)

# Cria o gráfico de barras empilhadas mostrando a proporção por hora e classificação
grafico_variacao_hora_classificacao <- ggplot(acidentes_por_hora_classificacao,
                                              aes(x = hora, y = proporcao, fill = classificacao_acidente)) +
  geom_bar(stat = "identity", position = "dodge") + # Usamos position = "dodge" para barras lado a lado
  labs(title = "Variação da Proporção de Classificação de Acidentes por Hora",
       x = "Hora do Dia",
       y = "Proporção de Acidentes",
       fill = "Classificação do Acidente") +
  scale_x_continuous(breaks = 0:23) +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_brewer(palette = "Set2") + # Escolha uma paleta de cores agradável
  theme_minimal()

# Exibe o gráfico de variação por hora e classificação
print(grafico_variacao_hora_classificacao)

# --- Outra forma de visualizar: gráfico de linhas ---
grafico_linha_variacao_hora_classificacao <- ggplot(acidentes_por_hora_classificacao,
                                                    aes(x = hora, y = proporcao, color = classificacao_acidente)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  labs(title = "Variação da Proporção de Classificação de Acidentes ao Longo do Dia",
       x = "Hora do Dia",
       y = "Proporção de Acidentes",
       color = "Classificação do Acidente") +
  scale_x_continuous(breaks = 0:23) +
  scale_y_continuous(labels = scales::percent) +
  scale_color_brewer(palette = "Set2") +
  theme_minimal()

# Exibe o gráfico de linhas
print(grafico_linha_variacao_hora_classificacao)

#/////////////////////////////////

# Assumindo que seu dataframe se chama 'dados'
# Extrai a hora da coluna "horario"
acidentes <- dados %>%
  mutate(hora = as.numeric(substr(horario, 1, 2)))

# Filtra apenas os acidentes com vítimas fatais
acidentes_fatais <- acidentes %>%
  filter(classificacao_acidente == "Com Vítimas Fatais")

# Filtra os acidentes fatais que ocorreram no pico de hora (18h ou 19h)
acidentes_fatais_pico <- acidentes_fatais %>%
  filter(hora %in% c(18, 19))

# Conta a ocorrência de cada tipo de acidente fatal no pico de hora
tipo_acidente_fatal_pico <- acidentes_fatais_pico %>%
  group_by(tipo_acidente) %>%
  summarise(n_ocorrencias = n(), .groups = 'drop') %>%
  arrange(desc(n_ocorrencias))

# Exibe os tipos de acidentes fatais mais frequentes no pico
print("Tipos de acidentes fatais mais frequentes no pico (18h-19h):")
print(tipo_acidente_fatal_pico)

# Se quiser visualizar isso em um gráfico de barras:
grafico_tipo_acidente_fatal_pico <- ggplot(tipo_acidente_fatal_pico, aes(x = reorder(tipo_acidente, n_ocorrencias), y = n_ocorrencias)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Tipos de Acidentes Fatais no Pico (18h-19h)",
       x = "Tipo de Acidente",
       y = "Número de Ocorrências") +
  coord_flip() + # Para facilitar a leitura de nomes longos
  theme_minimal()

# Exibe o gráfico
print(grafico_tipo_acidente_fatal_pico)

#///////////////////////////////////////////

# Extrai a hora da coluna "horario"
acidentes <- dados %>%
  mutate(hora = as.numeric(substr(horario, 1, 2)))

# Filtra apenas os acidentes com vítimas fatais
acidentes_fatais <- acidentes %>%
  filter(classificacao_acidente == "Com Vítimas Fatais")

# Filtra os acidentes fatais que ocorreram no pico de hora (18h ou 19h)
acidentes_fatais_pico <- acidentes_fatais %>%
  filter(hora %in% c(18, 19))

# Conta a ocorrência de cada causa de acidente fatal no pico de hora
causa_acidente_fatal_pico <- acidentes_fatais_pico %>%
  group_by(tipo_pista) %>%
  summarise(n_ocorrencias = n(), .groups = 'drop') %>%
  arrange(desc(n_ocorrencias))

# Exibe as causas de acidentes fatais mais frequentes no pico
print("Causas de acidentes fatais mais frequentes no pico (18h-19h):")
print(causa_acidente_fatal_pico)

#RRRRRRRRRRRRRRRRRRRRRRRRR
# Seleciona as 10 categorias mais frequentes (opcional)
top10_tipo_pista <- causa_acidente_fatal_pico %>%
  slice_max(n_ocorrencias, n = 10)

# Cria o gráfico de barras verticais
ggplot(top10_tipo_pista, aes(x = reorder(tipo_pista, -n_ocorrencias), y = n_ocorrencias)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_text(aes(label = n_ocorrencias), vjust = -0.5, size = 3.5) +
  labs(
    title = "Top tipos de pista em acidentes fatais no pico (18h–19h)",
    x = "Tipo de Pista",
    y = "Número de Ocorrências"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))




# Se quiser visualizar isso em um gráfico de barras:
grafico_causa_acidente_fatal_pico <- ggplot(causa_acidente_fatal_pico, aes(x = reorder(fase_dia, n_ocorrencias), y = n_ocorrencias)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Fases do Dia com mais Ocorrência Fatais no Pico (18h-19h)",
       x = "Fases do Dia",
       y = "Número de Ocorrências") +
  coord_flip() + # Para facilitar a leitura de nomes longos
  theme_minimal()

# Exibe o gráfico
print(grafico_causa_acidente_fatal_pico)

# causa de acidentes por horario -------------------------------------
causa_ac <- dados %>%
  mutate(hora = as.numeric(substr(horario, 1, 2)))

# Filtra apenas os acidentes com vítimas fatais
causa_acidentes_fatais <- acidentes %>%
  filter(classificacao_acidente == "Com Vítimas Fatais")

# Filtra os acidentes fatais que ocorreram no pico de hora (18h ou 19h)
causas_fatais_pico <- causa_acidentes_fatais %>%
  filter(hora %in% c(18, 19))

# Conta a ocorrência de cada causa de acidente fatal no pico de hora
causa_acidente_fatal_pico <- causas_fatais_pico %>%
  group_by(causa_acidente) %>%
  summarise(n_ocorrencias = n(), .groups = 'drop') %>%
  mutate(proporcao = round(100 * n_ocorrencias / sum(n_ocorrencias), 2)) %>%
  arrange(desc(n_ocorrencias))

# Exibe as causas de acidentes fatais mais frequentes no pico
print("Causas de acidentes fatais mais frequentes no pico (18h-19h):")
print(causa_acidente_fatal_pico)

# Carrega a biblioteca ggplot2 (instale se necessário)
library(ggplot2)

# Seleciona as 10 causas mais frequentes
top10_causas <- causa_acidente_fatal_pico %>%
  slice_max(n_ocorrencias, n = 10)

# Cria o gráfico de barras
ggplot(top10_causas, aes(x = reorder(causa_acidente, n_ocorrencias), y = n_ocorrencias)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_text(aes(label = paste0(proporcao, "%")), hjust = -0.1, size = 3.5) +
  coord_flip() +
  labs(
    title = "Top 10 causas de acidentes fatais no pico (18h–19h)",
    x = "Causa do Acidente",
    y = "Número de Ocorrências"
  ) +
  theme_minimal()

print(top10_causas)

# trancado via -------------------------------------
trancado <- dados %>%
  mutate(hora = as.numeric(substr(horario, 1, 2)))

# Filtra apenas os acidentes com vítimas fatais
tracado_fatais <- trancado %>%
  filter(classificacao_acidente == "Com Vítimas Fatais")

# Filtra os acidentes fatais que ocorreram no pico de hora (18h ou 19h)
trancado_fatais_pico <- tracado_fatais %>%
  filter(hora %in% c(18, 19))

# Conta a ocorrência de cada causa de acidente fatal no pico de hora
trancado_acidente_fatal_pico <- trancado_fatais_pico %>%
  group_by(tracado_via) %>%
  summarise(n_ocorrencias = n(), .groups = 'drop') %>%
  mutate(proporcao = round(100 * n_ocorrencias / sum(n_ocorrencias), 2)) %>%
  arrange(desc(n_ocorrencias))

# Exibe as causas de acidentes fatais mais frequentes no pico
print("Causas de acidentes fatais mais frequentes no pico (18h-19h):")
print(trancado_acidente_fatal_pico)

# Carrega a biblioteca ggplot2 (instale se necessário)
library(ggplot2)

# Seleciona as 10 causas mais frequentes
top10_causas <- causa_acidente_fatal_pico %>%
  slice_max(n_ocorrencias, n = 10)

# Cria o gráfico de barras
ggplot(top10_causas, aes(x = reorder(causa_acidente, n_ocorrencias), y = n_ocorrencias)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_text(aes(label = paste0(proporcao, "%")), hjust = -0.1, size = 3.5) +
  coord_flip() +
  labs(
    title = "Top 10 causas de acidentes fatais no pico (18h–19h)",
    x = "Causa do Acidente",
    y = "Número de Ocorrências"
  ) +
  theme_minimal()

# Carrega a biblioteca ggplot2
library(ggplot2)

# Seleciona as 10 categorias mais frequentes
top10_tracado <- trancado_acidente_fatal_pico %>%
  slice_max(n_ocorrencias, n = 10)

# Cria o gráfico de barras horizontais
ggplot(top10_tracado, aes(x = reorder(tracado_via, n_ocorrencias), y = n_ocorrencias)) +
  geom_bar(stat = "identity", fill = "darkgreen") +
  geom_text(aes(label = paste0(proporcao, "%")), hjust = -0.1, size = 3.5) +
  coord_flip() +
  labs(
    title = "Top 10 traçados de via em acidentes fatais no pico (18h–19h)",
    x = "Traçado da Via",
    y = "Número de Ocorrências"
  ) +
  theme_minimal()
#---------------------------------- veiculos

library(dplyr)
library(ggplot2)

# Supondo que seu dataframe se chama 'seu_dataframe' (substitua pelo nome real)

# Filtra os dados para acidentes fatais no pico de 18h-19h
acidentes_fatais_pico <- dados %>%
  filter(grepl("^18:", horario) | grepl("^19:", horario),
         classificacao_acidente == "Com Vítimas Fatais")

# Calcula o número total de veículos por tipo de pista
total_veiculos_por_pista <- acidentes_fatais_pico %>%
  group_by(tipo_pista) %>%
  summarise(total_veiculos = sum(veiculos, na.rm = TRUE),
            total_ocorrencias = n()) %>%
  arrange(desc(total_ocorrencias)) %>%
  slice_max(total_ocorrencias, n = 10) # Opcional: Top 10 tipos de pista

# Cria o gráfico de barras verticais com o número total de veículos
ggplot(total_veiculos_por_pista, aes(x = reorder(tipo_pista, -total_veiculos), y = total_veiculos)) +
  geom_bar(stat = "identity", fill = "darkgreen") +
  geom_text(aes(label = total_veiculos), vjust = -0.5, size = 3.5) +
  labs(
    title = "Total de Veículos em Acidentes Fatais no Pico (18h–19h) por Tipo de Pista",
    x = "Tipo de Pista",
    y = "Número Total de Veículos"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#-------------2

acidentes <- dados %>%
  mutate(hora = as.numeric(substr(veiculos, 1, 2))) %>%
  arrange(hora)

# Exibe as primeiras linhas dos dados organizados para verificar
head(acidentes)

# Conta o número de acidentes por hora
acidentes_por_hora <- acidentes %>%
  group_by(hora) %>%
  summarise(n_acidentes = n())

# Exibe o resultado da contagem
print(acidentes_por_hora)

# Cria o gráfico de barras
grafico_acidentes_hora <- ggplot(acidentes_por_hora, aes(x = hora, y = n_acidentes)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Número de Acidentes por Hora",
       x = "Hora do Dia",
       y = "Número de Acidentes") +
  scale_x_continuous(breaks = 0:23) + # Garante que todas as horas apareçam no eixo x
  theme_minimal()

# Exibe o gráfico
print(grafico_acidentes_hora)

acidentes <- dados %>%
  mutate(hora = as.numeric(substr(veiculos, 1, 2)))

# Conta o número total de acidentes
total_acidentes <- nrow(acidentes)

# Calcula o número de acidentes por hora e classificação
acidentes_por_hora_classificacao <- acidentes %>%
  group_by(hora, classificacao_acidente) %>%
  summarise(n_acidentes = n(), .groups = 'drop') %>%
  mutate(proporcao = n_acidentes / total_acidentes)

# Exibe o resultado com as proporções por hora e classificação
print(acidentes_por_hora_classificacao)



# Supondo que seu dataframe se chama 'seu_dataframe' (substitua pelo nome real)

# Filtra os dados para acidentes fatais no pico de 18h-19h
acidentes_fatais_pico <- dados %>%
  filter(grepl("^18:", horario) | grepl("^19:", horario),
         classificacao_acidente == "Com Vítimas Fatais")

# Calcula o número total de veículos por tipo de pista
total_veiculos_por_pista <- acidentes_fatais_pico %>%
  group_by(veiculos) %>%
  summarise(total_veiculos = sum(veiculos, na.rm = TRUE),
            total_ocorrencias = n()) %>%
  arrange(desc(total_ocorrencias)) %>%
  slice_max(total_ocorrencias, n = 10) # Opcional: Top 10 tipos de pista

print(total_veiculos_por_pista)




library(dplyr)
library(ggplot2)

# Supondo que seu dataframe se chama 'seu_dataframe' (substitua pelo nome real)

library(dplyr)
library(ggplot2)

# Supondo que seu dataframe se chama 'seu_dataframe' (substitua pelo nome real)

# Filtra os dados para acidentes fatais no pico de 18h-19h
acidentes_fatais_pico <- dados %>%
  filter(grepl("^18:", horario) | grepl("^19:", horario),
         classificacao_acidente == "Com Vítimas Fatais")

# Extrai a hora do horário
acidentes_fatais_pico <- acidentes_fatais_pico %>%
  mutate(hora_pico = substr(horario, 1, 2))

# Calcula o número total de veículos por hora do pico
total_veiculos_por_hora <- acidentes_fatais_pico %>%
  group_by(hora_pico) %>%
  summarise(total_veiculos = sum(veiculos, na.rm = TRUE)) %>%
  arrange(hora_pico)

# Cria o gráfico de barras
ggplot(total_veiculos_por_hora, aes(x = hora_pico, y = total_veiculos)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_text(aes(label = total_veiculos), vjust = -0.5, size = 4) +
  labs(
    title = "Distribuição do Total de Veículos em Acidentes Fatais no Pico (18h–19h) por Hora",
    x = "Hora do Pico",
    y = "Número Total de Veículos"
  ) +
  theme_minimal()
#///////////////////////////////////////
library(dplyr)
library(ggplot2)
library(dplyr)
library(ggplot2)

# Supondo que seu dataframe se chama 'dados' e tenha colunas 'horario' e 'veiculos'
# e 'classificacao_acidente'

# Filtra os dados para acidentes fatais
acidentes_fatais <- dados %>%
  filter(classificacao_acidente == "Com Vítimas Fatais")

# Extrai a hora do horário
acidentes_fatais <- acidentes_fatais %>%
  mutate(hora_acidente = as.integer(substr(horario, 1, 2)))

# Calcula o número total de veículos por hora do dia
total_veiculos_por_hora_dia <- acidentes_fatais %>%
  group_by(hora_acidente) %>%
  summarise(total_veiculos = sum(veiculos, na.rm = TRUE)) %>%
  arrange(hora_acidente)

# Cria o gráfico de barras
ggplot(total_veiculos_por_hora_dia, aes(x = as.factor(hora_acidente), y = total_veiculos)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_text(aes(label = total_veiculos), vjust = -0.5, size = 3) +
  labs(
    title = "Total de Veículos em Acidentes Fatais por Hora do Dia",
    x = "Hora do Dia",
    y = "Número Total de Veículos"
  ) +
  theme_minimal() +
  scale_x_discrete(breaks = as.factor(0:23))

