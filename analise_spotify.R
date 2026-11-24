#limpeza e tratamento dos dados
library(readr)
Spotify_Most_Streamed_Songs <- read_csv("Spotify Most Streamed Songs.csv")
dados<-Spotify_Most_Streamed_Songs
rm(Spotify_Most_Streamed_Songs)
library(lubridate)
#Formatação de datas
dados$released_date <- dmy(paste(dados$released_day,"-",dados$released_month,"-",dados$released_year))
dados <- dados[,-c(4,5,6)]
dados <- dados[, -c(22)]
library(dplyr)
library(tidyverse)
#Limpeza dos NA´s
dados <- dados %>%
mutate(across(where(is.numeric), ~ replace_na(., 0)))
#eliminação da linha 575, que está desformatada no ficheiro original
dados <- dados[-575,]
#a coluna streams vem como texto por causa dessa linha; converter já para numérico
dados$streams <- as.numeric(as.character(dados$streams))
#Verificar se exitem linhas iguais
duplicadas <- dados[duplicated(dados) | duplicated(dados, fromLast = TRUE), ]
nrow(duplicadas)

#---------------------------------------------------------------
#Verificar máximos e minimos das funções
max(dados$released_date)
min(dados$released_date)
max(dados$streams)
min(dados$streams)
max(dados$bpm)
min(dados$bpm)
min(dados$`danceability_%`)
max(dados$`danceability_%`)
min(dados$`instrumentalness_%`)
max(dados$`instrumentalness_%`)
min(dados$`acousticness_%`)
max(dados$`acousticness_%`)
min(dados$`liveness_%`)
max(dados$`liveness_%`)
min(dados$`speechiness_%`)
max(dados$`speechiness_%`)



#------------------------------------------------
#Somas e medias dos dados
soma_in_spotify_playlists <- sum(dados$in_spotify_playlists, na.rm = TRUE)
print(soma_in_spotify_playlists)
soma_in_apple_playlists <- sum(dados$in_apple_playlists, na.rm = TRUE)
print(soma_in_apple_playlists)
soma_in_deezer_playlists <- sum(dados$in_deezer_playlists, na.rm = TRUE)
print(soma_in_deezer_playlists)
media_bpm <- mean(dados$bpm, na.rm = TRUE)
print(media_bpm)
media_danceability <- mean(dados$`danceability_%`, na.rm = TRUE)
print(media_danceability)
media_valence <- mean(dados$`valence_%`, na.rm = TRUE)
print(media_valence)
media_energy <- mean(dados$`energy_%`, na.rm = TRUE)
print(media_energy)
media_acousticness <- mean(dados$'acousticness_%', na.rm = TRUE)
print(media_acousticness)
soma_acousticness <- sum(dados$`acousticness_%`, na.rm = TRUE)
print(soma_acousticness)
media_liveness <- mean(dados$`liveness_%`, na.rm = TRUE)
print(media_liveness)
soma_liveness <- sum(dados$`liveness_%`, na.rm = TRUE)
print(soma_liveness)
media_speechiness <- mean(dados$`speechiness_%`, na.rm = TRUE)
print(media_speechiness)
soma_speechiness <- sum(dados$`speechiness_%`, na.rm = TRUE)
print(soma_speechiness)



#-------------------------------------------------
#Gráficos
library(ggplot2)
hist(dados$artist_count,)
ggplot(dados, aes(x=artist_count)) +
geom_histogram(bins=30, fill="blue", color="black") +
labs(title="Histograma de Contagem de Artistas", x="Contagem de Artistas", y="Frequência") +
theme_minimal()
hist(dados$in_spotify_playlists,)
ggplot(dados, aes(x=in_spotify_playlists)) +
geom_histogram(bins=20, fill="blue", color="black") +
labs(title="Histograma da Playlist do Spotify", x="Nº de vezes na playlist do Spotify", y="Frequência") +
theme_minimal()
hist(dados$in_spotify_charts,)
ggplot(dados, aes(x=in_spotify_charts)) +
geom_histogram(bins=20, fill="blue", color="black") +
labs(title="Histograma dos gráficos do Spotify", x="Nº de vezes nos gráficos do Spotify", y="Frequência") +
theme_minimal()
#Mudar o tipo da variável do dado
dados$streams <- as.numeric(as.character(dados$streams))
hist(dados$streams)
hist(dados$streams,)
ggplot(dados, aes(x=streams)) +
geom_histogram(bins=20, fill="blue", color="black") +
labs(title="Histograma das streams", x="Nº de streams", y="Frequência") +
theme_minimal()
hist(dados$in_apple_playlists,)
ggplot(dados, aes(x=in_apple_playlists)) +
geom_histogram(bins=20, fill="blue", color="black") +
labs(title="Histograma da Playlist da Apple", x="Nº de vezes na playlist", y="Frequência") +
theme_minimal()
hist(dados$in_apple_charts,)
ggplot(dados, aes(x=in_apple_charts)) +
geom_histogram(bins=20, fill="blue", color="black") +
labs(title="Histograma dos gráficos da Apple", x="Nº de vezes nos gráficos da Apple", y="Frequência") +
theme_minimal()
hist(dados$in_deezer_playlists,)
ggplot(dados, aes(x=in_deezer_playlists)) +
geom_histogram(bins=20, fill="blue", color="black") +
labs(title="Histograma da Playlist do Deezer", x="Nº de vezes na playlist", y="Frequência") +
theme_minimal()
hist(dados$in_deezer_charts,)
ggplot(dados, aes(x=in_deezer_charts)) +
geom_histogram(bins=20, fill="blue", color="black") +
labs(title="Histograma dos gráficos do deezer", x="Nº de vezes nos gráficos do deezer", y="Frequência") +
theme_minimal()
hist(dados$in_shazam_charts,)
ggplot(dados, aes(x=in_shazam_charts)) +
geom_histogram(bins=20, fill="blue", color="black") +
labs(title="Histograma dos gráficos do shazam", x="Nº de vezes nos gráficos do shazam", y="Frequência") +
theme_minimal()
hist(dados$bpm,)
ggplot(dados, aes(x=bpm)) +
geom_histogram(bins=20, fill="blue", color="black") +
labs(title="Histograma das batidas por minuto", x="Nº de batidas por minuto", y="Frequência") +
theme_minimal()
hist(dados$`danceability_%`,)
ggplot(dados, aes(x=`danceability_%`)) +
geom_histogram(bins=20, fill="blue", color="black") +
labs(title="Histograma da percentagem da música ser dançavel", x="Percentagem da música ser dançavel", y="Frequência") +
theme_minimal()
hist(dados$`valence_%`,)
ggplot(dados, aes(x=`valence_%`)) +
geom_histogram(bins=20, fill="blue", color="black") +
labs(title="Histograma da percentagem da positividade do contexto da música ", x="Percentagem da positividade do contexto da música ", y="Frequência") +
theme_minimal()
hist(dados$`acousticness_%`,)
ggplot(dados, aes(x=`acousticness_%`)) +
geom_histogram(bins=20, fill="blue", color="black") +
labs(title="Histograma da presença de som acústico na música ", x="Percentagem da presença de som acústico na música ", y="Frequência") +
theme_minimal()
ggplot(dados, aes(x = key)) +
geom_bar(fill="blue", color="black")  +
theme_minimal() +
labs(title = "Distribuição das Chaves Musicais", x = "Chave Musical", y = "Contagem")
ggplot(dados, aes(x = mode)) +
geom_bar(fill="blue", color="black")  +
theme_minimal() +
labs(title = "Distribuição do modo musical", x = "Modo", y = "Contagem")



#------------------------------------------------------------
#Tratamento da coluna key
sum(is.na(dados$key))
mode(dados$key)
dados$key<-as.factor(dados$key)
table(dados$key)
dados %>% group_by(key) %>%summarize(m=mean(bpm))
dados %>% group_by(key) %>%summarize(m=var(bpm))
#a correlação não se aplica a uma variável categórica (cor(dados$key, dados$bpm) dá erro),
#por isso cruzamos a key com o bpm agrupado em intervalos
dados$bpm_f <- cut(dados$bpm,12)
table(dados$bpm_f,dados$key)
dados$key<-as.character(dados$key)
dados$key[is.na(dados$key)]<-'Outra'
dados$key<-as.factor(dados$key)
table(dados$bpm_f,dados$key)
which(dados$streams==max(dados$streams))
dados$track_name[which(dados$streams==max(dados$streams))]
#analise da coluna key
library(dplyr)
dados %>%
count(dados$key)

#------------------------------
#analise da coluna mode
table(dados$mode)

#grafico bpm_f
ggplot(dados, aes(x = bpm_f)) +
  geom_bar(fill="blue", color="black")  +
  theme_minimal() +
  labs(title = "Distribuição das bpm", x = "BPM", y = "Contagem")

#-------------------------------------------------------------
#Modulação dos dados 
#Verificação dos tipos e das estatisticas do dados 
summary(dados)
#Instalar os pacotes 
library(rpart)  #arvore de decisão
library(rpart.plot) # visualizar a árvore
library(tidyverse) # manipulação de dados, visualização e análise
library(corrplot)  # criar gráficos de correlação
library(caret)    #construir e treinar modelos de aprendizagens
library(ggplot2) # gráficos
library(dplyr) # Manipulação de dados

#1º questão
cor_artists_charts <- cor(dados$artist_count, dados$streams)
print(paste("Correlação entre número de artistas e popularidade com base nas streams:", round(cor_artists_charts, 3)))
ggplot(dados, aes(x = artist_count, y = streams)) +
geom_point(color = "blue", alpha = 0.6) +
geom_smooth(method = "lm", color = "red") +
labs(title = "Relação entre Número de Artistas e Popularidade",
x = "Número de Artistas",
y = "Número de Streams") +
theme_minimal()

#Arvore de decisão
par(mfrow=c(1,1))
tree_model <- rpart(streams ~ artist_count ,
data = dados, method = "anova")
rpart.plot(tree_model,
main = "Árvore de Decisão para Popularidade",
type = 2, extra = 101, under = TRUE, cex = 0.7)

#2º questão
dados_limpos <- na.omit(dados[, c("streams", "bpm", "danceability_%", "energy_%",
"acousticness_%", "valence_%", "speechiness_%",
"instrumentalness_%", "liveness_%")])

modelo <- lm(streams ~ bpm + `danceability_%` + `energy_%` + `acousticness_%` +
`valence_%` + `speechiness_%` + `instrumentalness_%` + `liveness_%`,
data = dados_limpos)

summary(modelo)
print(coef(modelo))
par(mfrow = c(2, 2))
plot(modelo)        
par(mfrow = c(1, 1))

#Arvore de decisão
modelo_arvore <- rpart(
streams ~ bpm + `danceability_%` + `energy_%` + `acousticness_%` +
`valence_%` + `speechiness_%` + `instrumentalness_%` + `liveness_%`,
data = dados,  # Conjunto de dados
method = "anova"  # Método para variável dependente contínua
)
rpart.plot(modelo_arvore, type = 3, extra = 101, box.palette = "Blues")

#3ºquestao
# Selecionar variáveis relevantes e garantia que streams é numérico
data_model <- dados %>%
  select(`acousticness_%`, `instrumentalness_%`, `liveness_%`, streams)
data_model$streams <- as.numeric(data_model$streams)
# Divisão dos dados em treino e teste
set.seed(123) # Reprodutibilidade
train_index <- sample(seq_len(nrow(data_model)), size = 0.7 * nrow(data_model))
treino <- data_model[train_index, ]
teste <- data_model[-train_index, ]
# Garantir que streams em teste é numérico
teste$streams <- as.numeric(teste$streams)
# Modelo de Regressão Linear
modelo_rl <- lm(streams ~ `acousticness_%` + `instrumentalness_%` + `liveness_%`, data = treino)
summary(modelo_rl) # Resumo do modelo
# Avaliação no conjunto de teste (Regressão Linear)
pred_rl <- as.numeric(predict(modelo_rl, newdata = teste))
rmse_rl <- sqrt(mean((teste$streams - pred_rl)^2))
cat("RMSE Regressão Linear:", rmse_rl, "\n")
# Visualizar Predições vs Valores Reais (Regressão Linear)
plot(teste$streams, pred_rl, 
     main = "Predições vs Valores Reais (Regressão Linear)",
     xlab = "Streams Reais", 
     ylab = "Streams Previstos",
     pch = 16, col = "blue")
abline(0, 1, col = "red") # Linha de referência (y = x)

# Gráficos de Diagnóstico da Regressão
par(mfrow = c(2, 2)) # Organizar os gráficos em uma grade 2x2
plot(modelo_rl)
# Modelo de Árvore de Decisão
modelo_arvore <- rpart(streams ~ `acousticness_%` + `instrumentalness_%` + `liveness_%`, data = treino, method = "anova")
# Visualizar Árvore de Decisão
rpart.plot(modelo_arvore)
# Avaliação no conjunto de teste (Árvore de Decisão)
pred_arvore <- predict(modelo_arvore, newdata = teste)
rmse_arvore <- sqrt(mean((teste$streams - pred_arvore)^2))
cat("RMSE Árvore de Decisão:", rmse_arvore, "\n")
# Comparação de Resultados
cat("\nComparação de Modelos:\n")
cat("Regressão Linear - RMSE:", rmse_rl, "\n")
cat("Árvore de Decisão - RMSE:", rmse_arvore, "\n")


#4ºquestao
#Gráficos:
ggplot(dados, aes(x = `speechiness_%`, y = streams)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = TRUE) +
  labs(title = "Relação entre Speechiness e Streams (Popularidade)",
       x = "Speechiness (%)",
       y = "Streams (Número de Reproduções)") +
  theme_minimal()

modelo_speech <- lm(streams ~ `speechiness_%`, data = dados)
summary_modelo <- summary(modelo_speech)
capture.output(summary_modelo, file = "resumo_modelo.txt")

png("grafico_speechiness_streams.png")
plot(dados$`speechiness_%`, dados$streams,
     xlab = "Speechiness (%)", ylab = "Streams",
     main = "Relação entre Speechiness e Streams")
abline(modelo_speech, col = "red")
dev.off()

#Árvore de decisão:
# Modelo de Árvore de Decisão
modelo_arvore <- rpart(streams ~ `speechiness_%`, data = dados, method = "anova")
# Visualizar a árvore
rpart.plot(modelo_arvore, type = 3, box.palette = "Blues", fallen.leaves = TRUE,
           main = "Árvore de Decisão: Speechiness e Streams")

