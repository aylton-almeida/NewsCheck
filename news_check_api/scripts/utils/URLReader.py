import pprint
from urllib.request import urlopen, Request

from bs4 import BeautifulSoup, NavigableString

from lxml import html


class URLReader:
    soup = ''
    website = ''

    def __init__(self, url: str):
        if url.startswith('https://www.interfax.ru/') or url.startswith('http://www.interfax.ru/'):
            self.website = 'interfax'
        elif url.startswith('https://panorama.pub/') or url.startswith('http://panorama.pub/'):
            self.website = 'panorama'
        hdr = {'User-Agent': 'Mozilla/5.0'}
        req = Request(url, headers=hdr)
        self.soup = BeautifulSoup(urlopen(req), features='lxml')

    def get_text(self) -> tuple:
        if self.website == 'interfax':
            div = self.soup.find_all('article', {'itemprop': 'articleBody'})
            text = ''
            for tag in div:
                p_tags = tag.find_all('p')
                for t in p_tags:
                    text += self.get_content(t)
            return text, 0
        elif self.website == 'panorama':
            div = self.soup.find_all('div', {'class': 'entry-content'})
            text = ''
            for tag in div:
                p_tags = tag.find_all('p')
                for t in p_tags:
                    text += self.get_content(t)
            return text, 0
        elif self.website == '':
            return 'Website not registered.', 1

    def get_content(self, tag) -> str:
        content = ''
        for item in tag:
            if isinstance(item, NavigableString):
                content += item
            else:
                content += self.get_content(item)
        return content
