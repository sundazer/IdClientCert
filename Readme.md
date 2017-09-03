# Demo project for client certificate authentication with Delphi IndyHTTP

Simple example project to authenticate requests with client certificates against
a protected endpoint. Coded with Delphi 10.1 free edition. Uses IndyHTTP.

## Setup

Either install OpenSSL libraries and remove the line
`  IdSSLOpenSSLHeaders.IdOpenSSLSetLibPath(GetCurrentDir()); `
from Main.pas, or copy the [OpenSSL](https://www.openssl.org/community/binaries.html) compiled 32-bit libeay32.dll and ssleay32.dll to project root.

Copy required client certificate and client key to project root as client.crt and client.key.

Compile, enter url to editbox and press Connect. Memo should print out relevant info about the request.

## Credits
[Chau Chee Yang's blog](http://chee-yang.blogspot.fi/2008/03/using-indy-https-client-to-consume.html)