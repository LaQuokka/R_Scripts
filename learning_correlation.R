  
# APRENDENDO A RODAR CORRELAÇÕES
  #Objetivo: rodar uma correlação entre resultado primário da União e
  #índice de força do arcabouço fiscal para cada ano no brasil de 2000-2021

#fonte: http://sthda.com/english/wiki/correlation-test-between-two-variables-in-r

library("ggpubr")
my_data <- mtcars
head(my_data, 6)
my_data
#descriptions(my_data)
ggscatter(my_data, x = "mpg", y = "wt", 
          xlab = "Miles/(US) gallon", ylab = "Weight (1000 lbs)")

##3 tentando importar meus próprios dados
library('readxl')

#importando dados
dados_fri = read_excel('G:\\Meu Drive\\Projetos Atuais\\IC\\VS\\data_for_corr.xlsx')
dados_fri
#pegando nome das colunas do dataset
names = colnames(dados_fri) 
anos = dados_fri[[1]] # selecionando os anos do dataset como uma lista [[]]
ggscatter(dados_fri, x = '...1', y = 'FRI', title = 'resultado primario')

