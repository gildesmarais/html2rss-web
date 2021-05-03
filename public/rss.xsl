<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:fh="http://purl.org/syndication/history/1.0">
<xsl:output method="xml"/>
<xsl:template match="/">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8"/>
  <meta content="no-referrer" name="referrer"/>
  <meta content="width=device-width,initial-scale=1" name="viewport"/>
  <title><xsl:value-of select="rss/channel/title"/> (Feed)</title>
  <link href="/feed.svg" rel="icon"/>
  <link href="/water.css" rel="stylesheet"/>
  <style>
    :root {
      --links: #60b0f4;
      --highlight: #ff9300;
    }

    label {
      font-weight: bold;
      cursor: pointer;
      margin-top: 0.5em;
    }

    input[type="text"] {
      width: 100%;
      max-width: 780px;
    }

    body > h2 {
      margin-top: 2em;
    }

    .items {
      list-style: none;
      padding-left: 0;
      margin-top: 2em;
    }

    .items > li {
      background-color: var(--background);
      border-radius: 6px;
      padding: 0.5em 0.75em;
      margin-bottom: 1em;
    }

    .items > li:nth-child(odd) {
      background-color: var(--background-alt);
    }

    .items > li > h3 {
      margin-top: 0;
    }

    .item > li > div {
      font-size: .9em;
      padding: 0.25em;
    }
  </style>
</head>
<body>
  <header>
    <h1>
      <xsl:value-of select="rss/channel/title"/>
    </h1>
  </header>
  <aside>
    <p>
      This is a
      <a href="https://en.wikipedia.org/wiki/RSS" target="_blank" rel="noopener"> syndication feed (also known as <em>RSS</em>)</a>.
      <br/>
      You can follow this feed to get updates through a
      <a href="https://en.wikipedia.org/wiki/News_aggregator" target="_blank" rel="noopener">news aggregator</a> of your choice.
    </p>
  </aside>
  <main>
    <p>
      <label for="url">
        <img src="/feed.svg" height="16" width="16" alt="the orange RSS icon" role="presentation"/>
        Feed URL
      </label>
      <input id="url" type="text"/>
    </p>

    <h2>Feed content preview</h2>
    <ol class="items">
      <xsl:for-each select="rss/channel/item">
        <li>
          <h3>
            <a rel="noopener">
              <xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
              <xsl:value-of select="title"/>
            </a>
          </h3>
          <div>
            <xsl:value-of select="description" disable-output-escaping="yes"/>
          </div>
        </li>
      </xsl:for-each>
    </ol>
  </main>
  <footer>
    <p>
      This feed was generated by
      <code>
        <a href="https://html2rss.github.io/"><xsl:value-of select="rss/channel/generator" /></a>
      </code>.
    </p>
  </footer>
  <script type="text/javascript">
    const $url = document.getElementById('url')
    $url.value = window.location.href
    $url.addEventListener('click', ({ target }) => target.select())
  </script>
</body>
</html>
</xsl:template>
</xsl:stylesheet>