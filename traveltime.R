
# Install Packages --------------------------------------------------------

install.packages("rvest")
library(rvest)

install.packages("RCurl")
library(RCurl)


install.packages("httr")
library(httr)

# Scrape Google Maps Time -------------------------------------------------
url <- 'https://www.google.com/maps/dir/Fredericksburg,+VA/George+Mason+University,+University+Drive,+Fairfax,+VA/@38.5934617,-77.6130468,10z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x89b6c1ebbaeae025:0x7fa6450a21a691a1!2m2!1d-77.4605399!2d38.3031837!1m5!1m1!1s0x89b64e607b427ebd:0xd766a653e6557544!2m2!1d-77.3146731!2d38.8336468!3e0'

webpage <- read_html(url)

str(webpage)

#Using CSS selectors to scrape the timing section
time_html <- html_nodes(webpage, "span")

#Converting the timing data to text
time_data <- html_text(time_html)

#Let's have a look at the rankings
head(time_data)



page <- getURL('https://www.google.com/maps/dir/Fredericksburg,+VA/George+Mason+University,+University+Drive,+Fairfax,+VA/@38.5934617,-77.6130468,10z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x89b6c1ebbaeae025:0x7fa6450a21a691a1!2m2!1d-77.4605399!2d38.3031837!1m5!1m1!1s0x89b64e607b427ebd:0xd766a653e6557544!2m2!1d-77.3146731!2d38.8336468!3e0')

page <- GET('https://www.google.com/maps/dir/Fredericksburg,+VA/George+Mason+University,+University+Drive,+Fairfax,+VA/@38.5934617,-77.6130468,10z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x89b6c1ebbaeae025:0x7fa6450a21a691a1!2m2!1d-77.4605399!2d38.3031837!1m5!1m1!1s0x89b64e607b427ebd:0xd766a653e6557544!2m2!1d-77.3146731!2d38.8336468!3e0')

str(content(page, type = "text"), nchar.max = 2500)


