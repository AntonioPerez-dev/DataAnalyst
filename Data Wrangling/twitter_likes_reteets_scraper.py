"""Script for scraping likes and retweets from twitter (now X) website
   tweets are retrieved from a list/file, then retweets and likes are
   scraped."""
import time
from bs4 import BeautifulSoup
from selenium import webdriver
from pyvirtualdisplay import Display
import pandas as pd
tw_arch_enh_df = pd.read_csv('twitter-archive-enhanced.csv')
tweet_list = tw_arch_enh_df.tweet_id.to_list()

URL_PREFIX = 'https://twitter.com/dog_rates/status/'

display = Display(visible=0, size=(80,600))
display.start()
driver = webdriver.Chrome()

tweet_likes_df = pd.DataFrame({'tweet_id':[],
                        'retweets':[],
                        'likes':[]})

for tweet in tweet_list[:10]:
    url = URL_PREFIX + f'{tweet}'
    print(url)
    # initiating the webdriver. Parameter includes the path of the webdriver.
    driver.get(url)

    # this is just to ensure that the page is loaded
    time.sleep(10)

    html = driver.page_source

    # this renders the JS code and stores all
    # of the information in static HTML code.

    # Now, we could simply apply bs4 to html variable
    # pylint: disable=locally-disabled, line-too-long
    soup2 = BeautifulSoup(html, "html.parser")
    retweets = soup2.find_all('a', {"href":f'/dog_rates/status/{tweet}/retweets'})[0].span.span.span.contents
    likes = soup2.find_all('a', {'href':f'/dog_rates/status/{tweet}/likes'})[0].span.span.span.contents
    #new_row = {'tweet_id':f'{tweet}', 'retweets':f'{retweets}', 'likes':f'{likes}'}
    new_row = pd.DataFrame({'tweet_id':[tweet],'retweets':[retweets], 'likes':[likes]})
    tweet_likes_df = pd.concat([tweet_likes_df, new_row])
    print(new_row)

driver.close()                                              # closing the webdriver
display.stop()
pd.set_option('display.float_format', lambda x: f'{x:.0f}') # Avoid scientific notation
tweet_likes_df.reset_index(inplace=True, drop=True)         # Keep index continuous instead of all 0
print(tweet_likes_df)
