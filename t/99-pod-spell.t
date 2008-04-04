use strict;
use t::TestKotonoha;

BEGIN {
    test_requires('Test::Spelling');
}

use FindBin;
use Test::Spelling;

my $spell_cmd;
foreach my $path (split(/:/, $ENV{PATH})) {
    -x "$path/spell"  and $spell_cmd="spell", last;
    -x "$path/ispell" and $spell_cmd="ispell -l", last;
    -x "$path/aspell" and $spell_cmd="aspell list", last;
}
$ENV{SPELL_CMD} and $spell_cmd = $ENV{SPELL_CMD};
$spell_cmd or plan skip_all => "no spell/ispell/aspell";
set_spell_cmd($spell_cmd);

add_authors_to_stopwords();
add_stopwords(<DATA>);
all_pod_files_spelling_ok('lib');

sub add_authors_to_stopwords {
    my $file = "$FindBin::Bin/../AUTHORS";
    open my $fh, "<", $file or die "$file: $!";
    while (<$fh>) {
        chomp;
        tr/\(\)//d;
        add_stopwords(split /\s+/);
    }
}

__DATA__
access
account
AdSense
aggregator
aggregators
al
ala
allows
and
And
Anil
API
apihost
apirealm
apiurl
AppleScript
application
as
asahi
ascii
at
atomfeed
AtomPP
authen
AUTHOR
autodiscovery
AutoLink
Babelfish
backend
BalloonNotify
ben
blog's
blog
Blog
Bloglines
BlogPet's
BlogPet
blogroll
blogs
blosxom
bookmarked
bot
brian
Bulkfeeds
Buzzurl
callback
can
cc
ccTLD
CDTF
ch
chRSSPermalink
co
com
conf
CONFIGS
CONSTRUCTOR
ControlPort
CPAN
cronjob
csv
CSV
CVS
darwin
datetime
DateTime
de
Deduped
deduplicate
del
delimited
DESCRIPTION
dir
don
DWIM
DWIMs
easy
embeddable
Emoticon
emoticons
en
EntryFullText
Estraier
euc
exe
extendedPing
fallbacks
feedburner's
FeedBurner's
FeedBurner
FeedFlare
filename
Filename
Firefox
Flickr
FLV
foaf
FOAF
foafroll
following
foo
foobar
for
formatter
Fotolife
foy
free
freebsd
freenode
Frepa
FriendDiary
fulltext
FULLTEXT
get
gif
Gmail
google
GoogleTalk
guid
Gungho
hackish
hatena
Hatena
HatenaDiary
HatenaGroup
HatenaRSS
have
helpful
href
html
HTML
HTTP
iCal
icio
ics
id
IDs
IE
if
IKC
IMAP
ini
init
inline
interface
InternetExplorer
ip
IP
iPhoto
iPod
irc
ircbot
is
it
It
itself
iTunes
ized
ja
javascript
jp
JS
json
JSON
jsonp
JSONP
KinoSearch
koto
kotonoha
Kotonoha
kotonoha.cc
lang
Langworth's
lastBuildDate
library
LICENSE
Lilypond
Lingr
linux
list
listsubs
livedoor
Livedoor
livedoorClip
ll
login
Lucene
MacOSX
Maildir
mailfrom
mailroute
mailto
make
medoc
MeDoc
metadata
method
METHOD
methods
microformats
mixi
Mixi
modify
module
Moritapo
MozRepl
mp
MSN
MSWin
MyDiary
Namaan
Namazu
namespace
NetNewsWire
Newsoku
Newsokuize
NFC
NFD
NFKC
NFKD
Nihongo
not
object
Odeo
OPML
options
OSX
PalmDoc
parameter
PDF
perlbal
permalink
permalinks
photocast
pingserver
pipermail
plagger's
plagger
Plagger
plaggerbot
plaintext
playlog
pluggable
Pluggable
plugins
pm
POPFile
POSIX
PowerPoint
provide
PSP
pubDate
qpsmtpd
quickstart
Rast
rdf
RDF
rebless
RecentComment
redistribute
referer
remixer
required
requires
RFC
RPC
rsd
rss
RSS
rssad
same
san
SCREENSHOT
searchable
see
serializer
Serializer
shiftjis
sign
sixapart
SmartFeed
smartfeeds
smtp
software
SpamAssassin's
specified
Splog
SQL
src
SSH
SSTP
std
STDOUT
strptime
stylesheet
svn
SVN
swf
SYNOPSIS
tagline
takahashi
tDiary
technorati
templatize
terms
the
them
thingy
this
This
Thus
Tiarra
timezones
to
TODO
Trackback
Trott
Two
TZ
UA
under
unsubscribe
up
URI
url
URL
URLBL
urls
URLs
username
UTC
utf
varname
webbookmark
weblogUpdates
wget
Wiki
win32
with
wosit
www
XHTML
xml
XML
XMLRPC
XOXO
XPath
xul
XXX
YahooBlogSearch
yaml
YAML
you
You
your
YouTube
