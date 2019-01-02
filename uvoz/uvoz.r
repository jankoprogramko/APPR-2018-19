# 2. faza: Uvoz podatkov

#sl <- locale("sl", decimal_mark=",", grouping_mark=".")

# Funkcija, ki uvozi občine iz Wikipedije
#uvozi.obcine <- function() {
#  link <- "http://sl.wikipedia.org/wiki/Seznam_ob%C4%8Din_v_Sloveniji"
#  stran <- html_session(link) %>% read_html()
#  tabela <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
#    .[[1]] %>% html_table(dec=",")
#  for (i in 1:ncol(tabela)) {
#    if (is.character(tabela[[i]])) {
#      Encoding(tabela[[i]]) <- "UTF-8"
#    }
#  }
#  colnames(tabela) <- c("obcina", "povrsina", "prebivalci", "gostota", "naselja",
#                        "ustanovitev", "pokrajina", "regija", "odcepitev")
#  tabela$obcina <- gsub("Slovenskih", "Slov.", tabela$obcina)
#  tabela$obcina[tabela$obcina == "Kanal ob Soči"] <- "Kanal"
#  tabela$obcina[tabela$obcina == "Loški potok"] <- "Loški Potok"
#  for (col in c("povrsina", "prebivalci", "gostota", "naselja", "ustanovitev")) {
#    tabela[[col]] <- parse_number(tabela[[col]], na="-", locale=sl)
#  }
#  for (col in c("obcina", "pokrajina", "regija")) {
#    tabela[[col]] <- factor(tabela[[col]])
#  }
#  return(tabela)
#}

#61 do 102

# krogi <- data[c(3, 61:ncol(data))] %>% melt(id.vars="web_name") %>%
#   separate("variable", c("krog", "podatek"), ": ") %>%             
#   mutate(krog=parse_number(krog))

#unique(krogi["podatek"])



library(readr)
library(tidyr)
library(reshape2)
data1 <- read.csv("players_raw.csv")
igralci_skupaj <- data1[c(57, 47, 31, 22, 1, 6, 21, 41, 58, 40, 36, 37 )]
ekipe <- c("ARS", "BOU", "BRI", "BUR", "CAR", "CHE", "CRY", "EVE", "FUL", "HUD", "LEI", "LIV", "MCI", "MUN", "NEW", "SOU", "SPU", "WAT", "WSH", "WOL")
#ekipe1 <-- data11["team"]
#data11&web_nam
data2 <- read.csv("merged_gw.csv")
krogi <-data2[c(-6, -7, -11, -13, -14, -17, -21, -22, -23, -25, -26, -27, -28, -41, -47, -48, -49, -50, -51, -52)]
#separate(krogi["name"],"variable",c("ime","priimek","id") )
#krogi2 <- melt(krogi1, id.vars="round",measure.vars=names(krogi[-39]))






#,locale=locale(encoding="UTF-8")
# library(reshape2)
# library(dplyr)
# library(readr)
# library(tidyr)
# data <- read_csv("https://raw.githubusercontent.com/H-Cox/FPL/master/alldata.csv")
# 
# igralci <- data[, 1:60]
# igralci2 <- igralci[c(3, 5, 40:50)]
# krogi <- data[c(3, 61:ncol(data))] %>% melt(id.vars="web_name") %>%
#   separate("variable", c("krog", "podatek"), ": ") %>%             
#   mutate(krog=parse_number(krog))

#krogi2 <- slice(krogi, 3231:10336, 14859:ncol(data))
#krogi2 <- filter(krogi,podatek=="total_points")


# krogi2 <- filter(krogi, podatek == c("minutes", "goals_scored", "assists", "clean_sheets", "goals_conceded", "own_goals", "penalties_saved",
#                                      "penalties_missed", "yellow_cards", "red_cards", "saves", "open_play_crosses", "big_chances_created",
#                                      "clearances_blocks_interceptions", "recoveries", "key_passes", "tackles", "winning_goals", "attempted_passes",
#                                      "completed_passes", "penalties_conceded", "big_chances_missed", "errors_leading_to_goal",
#                                      "errors_leading_to_goal_attempt", "tackled", "offside", "target_missed", "fouls", "dribbles", "opponent_team",
#                                      "was_home", "team_goals", "opponent_goals"))

# Zapišimo podatke v razpredelnico obcine
#obcine <- uvozi.obcine()

# Zapišimo podatke v razpredelnico druzine.
#druzine <- uvozi.druzine(levels(obcine$obcina))

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.

