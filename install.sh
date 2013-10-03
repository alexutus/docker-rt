#!/bin/sh
set -eu

apt-get install -y libexpat1-dev libpq-dev

curl -L http://cpanmin.us | perl - --sudo App::cpanminus

cat <<EOM
Apache::Session
CGI
CGI::Cookie
CGI::Emulate::PSGI
CGI::PSGI
CSS::Squish
Class::Accessor
Convert::Color
Crypt::Eksblowfish
Crypt::SSLeay
Crypt::X509
DBD::Pg
DBI
DBIx::SearchBuilder
Data::GUID
Data::ICal
Date::Extract
Date::Manip
DateTime
DateTime::Format::Natural
DateTime::Locale
Devel::GlobalDestruction
Devel::StackTrace
Digest::MD5
Digest::SHA
Digest::base
Email::Address
Email::Address::List
Encode
Errno
FCGI
FCGI::ProcManager
File::Glob
File::ShareDir
File::Spec
File::Temp
File::Which
File::Which
Getopt::Long
Getopt::Long
GnuPG::Interface
HTML::Entities
HTML::FormatText::WithLinks
HTML::FormatText::WithLinks::AndTables
HTML::Mason
HTML::Mason::PSGIHandler
HTML::Quoted
HTML::RewriteAttributes
HTML::Scrubber
HTTP::Message
HTTP::Request::Common
IPC::Run3
JSON
LWP
LWP::Protocol::https
LWP::Simple
LWP::UserAgent
List::MoreUtils
Locale::Maketext
Locale::Maketext::Fuzzy
Locale::Maketext::Lexicon
Log::Dispatch
MIME::Entity
MIME::Types
Mail::Header
Mail::Mailer
Module::Refresh
Module::Versions::Report
Mozilla::CA
Net::CIDR
Net::SSL
PerlIO::eol
Plack
Plack::Handler::Starlet
Pod::Usage
Regexp::Common
Regexp::Common::net::CIDR
Regexp::IPv6
Role::Basic
Scalar::Util
Storable
String::ShellQuote
Symbol::Global::Name
Sys::Syslog
Term::ReadKey
Term::ReadLine
Text::ParseWords
Text::Password::Pronounceable
Text::Quoted
Text::Template
Text::WikiFormat
Text::Wrapper
Time::HiRes
Time::ParseDate
Tree::Simple
UNIVERSAL::require
URI
URI::QueryParam
XML::RSS
EOM
| xargs cpanm

curl http://download.bestpractical.com/pub/rt/devel/rt-4.2.0rc5.tar.gz | tar zx
cd rt-4.2.0rc5
