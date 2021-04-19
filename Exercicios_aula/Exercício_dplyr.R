library(tidyverse)

remotes::install_github("cienciadedatos/dados")
casas <- dados::casas

# Reescreva os códigos abaixo utilizando as funções across() e where().
# a) modo 1
casas %>%
  group_by(geral_qualidade) %>%
  summarise(
    acima_solo_area_media = mean(acima_solo_area, na.rm = TRUE),
    garagem_area_media = mean(garagem_area, na.rm = TRUE),
    valor_venda_medio = mean(venda_valor, na.rm = TRUE)
  )

# modo 2
casas %>%
  group_by(geral_qualidade) %>%
    summarise(across(
      .cols = c(acima_solo_area, garagem_area, venda_valor),
      .fns = mean, na.rm = TRUE
    ))

# b) modo 1
casas %>%
  filter_at(
    vars(porao_qualidade, varanda_fechada_area, cerca_qualidade),
    ~!is.na(.x)
  )


# modo 2
casas %>%







