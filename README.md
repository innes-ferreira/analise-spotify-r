# O que torna uma música popular no Spotify? Análise de dados em R

Projeto da unidade curricular de Fundamentos de Análise de Dados (Licenciatura em Matemática Aplicada e Tecnologias Digitais, Iscte, 2024/25).

Usámos um dataset com as músicas mais ouvidas no Spotify, com o número de streams, a presença em playlists e rankings, e características musicais como bpm, danceability, energy, acousticness e speechiness. Com estes dados tentámos responder a quatro perguntas:

1. O número de artistas de uma música afeta a sua popularidade?
2. As características musicais influenciam o número de streams?
3. A presença de elementos acústicos, instrumentais ou ao vivo afeta o desempenho da música?
4. As músicas com mais palavras faladas são mais ou menos populares?

## O que fizemos

- **Limpeza dos dados:** construímos a data de lançamento, removemos colunas redundantes e uma linha desformatada, tratámos os valores em falta e procurámos duplicados.
- **Análise exploratória:** estatísticas descritivas, histogramas e gráficos de barras em ggplot2.
- **Modelos:**
  - regressão linear com diagnóstico de resíduos;
  - árvores de regressão (rpart);
  - na 3.ª pergunta, as duas abordagens foram comparadas por RMSE, com divisão treino/teste de 70/30.

## Resultados

As características musicais explicam muito pouco do número de streams. Na 3.ª pergunta, a regressão linear tem um R² ajustado de 0,24%, e a regressão e a árvore têm um RMSE praticamente igual, cerca de 551 milhões de streams.

As músicas com 1 ou 2 artistas são as mais ouvidas, e a quantidade de palavras faladas tem uma relação negativa com os streams. Mas a popularidade depende sobretudo de fatores que não estão nos dados, como playlists, promoção e o algoritmo de recomendação.

## Como correr

1. O ficheiro `Spotify Most Streamed Songs.csv` já está nesta pasta.
2. Instala os pacotes:

   ```r
   install.packages(c("readr", "lubridate", "dplyr", "tidyverse", "ggplot2",
                      "rpart", "rpart.plot", "corrplot", "caret"))
   ```

3. Abre `analise_spotify.R` no RStudio, define esta pasta como diretório de trabalho e corre o script.

## Relatório

O relatório completo, com a análise de cada gráfico e modelo, está em `Relatorio_Spotify.pdf`.

## Dados

Dataset público do Kaggle, *Spotify Most Streamed Songs* (953 músicas).

## Autoras

Catarina Pereira, Inês Ferreira e Nádia Santos.
