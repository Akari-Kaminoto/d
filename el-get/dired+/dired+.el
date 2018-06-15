<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html><head>
<meta type="copyright" content="Copyright (C) 1996-2016 The Squid Software Foundation and contributors">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ERROR: Cache Access Denied</title>
<style type="text/css"><!-- 
 /*
 * Copyright (C) 1996-2016 The Squid Software Foundation and contributors
 *
 * Squid software is distributed under GPLv2+ license and includes
 * contributions from numerous individuals and organizations.
 * Please see the COPYING and CONTRIBUTORS files for details.
 */

/*
 Stylesheet for Squid Error pages
 Adapted from design by Free CSS Templates
 http://www.freecsstemplates.org
 Released for free under a Creative Commons Attribution 2.5 License
*/

/* Page basics */
* {
	font-family: verdana, sans-serif;
}

html body {
	margin: 0;
	padding: 0;
	background: #efefef;
	font-size: 12px;
	color: #1e1e1e;
}

/* Page displayed title area */
#titles {
	margin-left: 15px;
	padding: 10px;
	padding-left: 100px;
	background: url('/squid-internal-static/icons/SN.png') no-repeat left;
}

/* initial title */
#titles h1 {
	color: #000000;
}
#titles h2 {
	color: #000000;
}

/* special event: FTP success page titles */
#titles ftpsuccess {
	background-color:#00ff00;
	width:100%;
}

/* Page displayed body content area */
#content {
	padding: 10px;
	background: #ffffff;
}

/* General text */
p {
}

/* error brief description */
#error p {
}

/* some data which may have caused the problem */
#data {
}

/* the error message received from the system or other software */
#sysmsg {
}

pre {
    font-family:sans-serif;
}

/* special event: FTP / Gopher directory listing */
#dirmsg {
    font-family: courier;
    color: black;
    font-size: 10pt;
}
#dirlisting {
    margin-left: 2%;
    margin-right: 2%;
}
#dirlisting tr.entry td.icon,td.filename,td.size,td.date {
    border-bottom: groove;
}
#dirlisting td.size {
    width: 50px;
    text-align: right;
    padding-right: 5px;
}

/* horizontal lines */
hr {
	margin: 0;
}

/* page displayed footer area */
#footer {
	font-size: 9px;
	padding-left: 10px;
}


body
:lang(fa) { direction: rtl; font-size: 100%; font-family: Tahoma, Roya, sans-serif; float: right; }
:lang(he) { direction: rtl; }
 --></style>
</head><body id=ERR_CACHE_ACCESS_DENIED>
<div id="titles">
<h1>ERROR</h1>
<h2>Cache Access Denied.</h2>
</div>
<hr>

<div id="content">
<p>The following error was encountered while trying to retrieve the URL: <a href="https://raw.github.com/*">https://raw.github.com/*</a></p>

<blockquote id="error">
<p><b>Cache Access Denied.</b></p>
</blockquote>

<p>Sorry, you are not currently allowed to request https://raw.github.com/* from this cache until you have authenticated yourself.</p>

<p>Please contact the <a href="mailto:root?subject=CacheErrorInfo%20-%20ERR_CACHE_ACCESS_DENIED&amp;body=CacheHost%3A%20proxy.ntt-el.com%0D%0AErrPage%3A%20ERR_CACHE_ACCESS_DENIED%0D%0AErr%3A%20%5Bnone%5D%0D%0ATimeStamp%3A%20Thu,%2007%20Jun%202018%2005%3A42%3A46%20GMT%0D%0A%0D%0AClientIP%3A%20143.125.184.221%0D%0A%0D%0AHTTP%20Request%3A%0D%0ACONNECT%20%2F%20HTTP%2F1.1%0AHost%3A%20raw.github.com%3A443%0D%0A%0D%0A%0D%0A">cache administrator</a> if you have difficulties authenticating yourself.</p>

<br>
</div>

<hr> 
<div id="footer">
<p>Generated Thu, 07 Jun 2018 05:42:46 GMT by proxy.ntt-el.com (squid/3.5.20)</p>
<!-- ERR_CACHE_ACCESS_DENIED -->
</div>
</body></html>
