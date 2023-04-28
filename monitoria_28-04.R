#monitoria 28/04/2023

# Questão 1 (Wooldridge), código em resol

# pacotes a serem utilizados
  #obs.: é normal aparecer um warning de que o pacote foi construído sob outra 
  #versão do R
  #obs.: se um pacote não estiver 
library(tidyverse)
library(wooldridge)

# --- QUESTÃO 1 ---
# --- parte 1  --- 
# buscando dados da questão

dados <- wooldridge::sleep75
view(dados)

# elaborar a regressão que associa tempo trabalhado e tempo de sono por semana
# dormir = beta0 + beta1*trab + u

#A) montando a regressão linear
reg1 <- lm(sleep ~ totwrk, dados) # fazendo a regressão linear
summary(reg1) # esse é um dos jeitos de ver a regressão

# reportando os dados na forma de uma equação
#dormir = 3586.38 - 0.15*totwkr

# R**2 = 10,33% (multiple R-squared); significa que a equação explica 10% do
# fenômeno. na vida real isso já é muito

R = 0.1033
#B) analisando o intercepto

horas = 3586/60 # em horas
dia = horas/7
dia

# o intercepto implica que o valor estimado de horas de sono para uma pessoa 
# que não trabalha (twork = 0) é de 3856 minutos

#C) se aumentarmos o trabalho em 2h por semana...
  #obs.: estamos considerando que ela trabalha 0h/semana inicialmente
# dormir = 3856,38 -0.15*120

# criando uma função com a equação da regressão linear
func1 <- function(totwkr){
  3586.37695 - 0.15075*totwkr
  }

# se a pessoa não trabalha
n_trab <- func1(0)
trab_2h <- func1(120)

dif = n_trab - trab_2h

# --- parte 2 ---
#A) se os adultos trocam sono por trabalho, o sinal deveria ser negativo,
# pois horas de trabalho e de sono tem uma relação inversamente proporcional
# (ceteris paribus)

#B) nâo há uma relação estatisticamente significante de fácil intuição

#C) elaborar a regressaõ linear múltipla

reg2 <- lm(sleep ~ totwrk + educ + age, dados)
summary(reg2)

# obtendo o modelo do enunciado
# Novo R**2> 0.1134 = 11,34%
novo_R2 = 0.1134

dif_R = novo_R2 - R # nosso ganho em termos de explicação da variável
                    # dependente

# parametros:
totwrkB2 = -0.14837
educB2 = -11.13381
ageB2 = 2.19988
interceptB2 = 3638.24531


func2 <- function(totwrk, educ, age){
  interceptB2 + educB2*educ + ageB2*age + totwrkB2*totwrk
}

# temos um problema nessa regressão: estamos variando em 1min de sono/trabalho
# e 1 ano de educação

# Fazendo o logaritmo neperiano da regressão
library("SciViews")
dados$lnsleep <- dados %>% mutate(lnsleep = ln(sleep))
view(dados)
