#!/usr/bin/perl
#####################################################################
#      Comandi Linux                                               ##  
#                                                                  ##
#####################################################################
#               a8888b.                                            ##
#              d888888b.                                           ##
#              8P YP Y88                                           ##
#              8|o||o|88                                           ##
#              8'    .88                                           ##
#              8`._.' Y8.                                          ##
#             d/      `8b.       DaNnO r0x                         ##
#           .dP   .     Y8b.                                       ##
#          d8:'       `::88b.     KiLL -9                          ##
#         d8            `Y88b           Cr3w                       ##
#        :8P     '       :888                                      ##
#         8a.    :      _a88P                                      ##
#       ._/ Yaa_ :    .| 88P|                                      ##
#       \    YP       `| 8P  `.                                    ##
#       /     \._____.d|    .'                                     ##
#       `--..__)888888P`._.'                                       ##
##                                                                 ##
#####################################################################

print q{
------------------------------------------------
               a8888b.                                            
              d888888b.                                           
              8P YP Y88                                            
              8|o||o|88                                           
              8'    .88         DaNnO r0x                                       
              8`._.' Y8.                                          
             d/      `8b.               
           .dP   .     Y8b.                                       
          d8:'       `::88b.     KiLL -9                          
         d8            `Y88b           Cr3w                          
        :8P     '       :888                                  
         8a.    :      _a88P                                      
       ._/ Yaa_ :    .| 88P|  
       \    YP       `| 8P  `.                                    
       /     \._____.d|    .'                                     
       `--..__)888888P`._.'     

------------------------------------------------
[+] Caricamento
[+] Source Privato

};

use Socket;
use IO::Socket::INET;
use HTTP::Request::Common;
use Net::FTP;
use LWP::UserAgent;

#NOME PROCESSO
my $np = 'comandilinux.pl';

#DATI ACCESSO IRCD
my $nick = '3XPL01T';
my $usernick = 'bot Lista PERL Linux';
my $passn = 'ior0x0';
my $mailbot = "Linux\@h4ck3d.org";
my $ircd = '192.168.1.108';
my $porta = 6667;
my $canale = "\#IRchelp";
my $canale4 = "\#Opers";
my $benvenuto = "10C0iao";

#STABILISCO L'/GLI AMMINISTRATORE/I DEL BOT
our @admin = ("Nick");

#PROCESSO CGI
$0="$np"."\0"x16;;
my $PID = fork;
exit if $PID;

#CHECPOINT CONNESSIONE
connetti:

#CONNESSIONE
my $net = new IO::Socket::INET(	PeerAddr => $ircd, 
				PeerPort => $porta, 
				Proto => 'tcp') or print "Non riesco a connettermi al server\r\n" and goto connetti;

#DICO AL SERVER IL MIO NICK E IL MIO NOME REALE
print $net "NICK $nick\r\n";
print $net "USER $usernick\r\n";


while ($srv = <$net>){
#SOLO DOPO AVER TERMINATO IL MESSAGGIO DI BENVENUTO DEL SERVER ESEGUO ULTERIORI COMANDI
if ($srv=~ /^:(.+?)\.(.+?)\.(.+?) (.+?) $nick :(.+?) (.+?) \/MOTD (.+?)\./i){
print $net "JOIN $canale\r\n";
print $net "JOIN $canale4\r\n";
#abilitato solo al primo accesso registra il nick
print $net "NS REGISTER $passn lista_Perl\@Super_H4ck3D.eu\r\n";
#abilitato dal secondo accesso in poi identifica il nick al server
print $net "NS IDENTIFY $passn\r\n";
}

#RISPONDO AI PING DEL SERVER
if ($srv=~ /PING :(.*)$/i){
print $net "PONG $1\r\n";
}

#RICAVO IL PID DEL PROGRAMMA
if ($srv=~ /^:(.+)!(.+)@(.+) PRIVMSG $nick :.pid/i){
print $net "PRIVMSG H4ck3D $$\r\n";
}


#menu
if ($srv=~ /^:(.+?)!(.+?)@(.+?) PRIVMSG $canale :.comandi/i){
print $net "PRIVMSG $canale 4.5:0Comandi4:5.\r\n";
print $net "PRIVMSG $canale 4.8parte14: 0Lavorare file e directory;\r\n";
print $net "PRIVMSG $canale 4.8parte24: 0Filesystem e processi;\r\n";
print $net "PRIVMSG $canale 4.8parte34: 0Sistema; \r\n";
print $net "PRIVMSG $canale 4.8parte44: 0Vari; \r\n";
print $net "PRIVMSG $canale 4.8parte54: 0Comandi Tecnici; \r\n";
print $net "PRIVMSG $canale 4.8parte64: 0Comandi Utili; \r\n";

}

#Comandi
if ($srv=~ /^:(.+?)!(.+?)@(.+?) PRIVMSG $canale :.parte1/i){
print $net "PRIVMSG $canale 4.5:0Lavorare file e directory4:5.\r\n";
print $net "PRIVMSG $canale 8cd4: 0 cambia la directory corrente;\r\n";
print $net "PRIVMSG $canale 8ls4: 0mostra il contenuto di una directory;\r\n";
print $net "PRIVMSG $canale 8cp4: 0copia file e directory; \r\n";
print $net "PRIVMSG $canale 8rm4: 0cancella file e directory; \r\n";
print $net "PRIVMSG $canale 8mkdir4: 0crea una directory; \r\n";
print $net "PRIVMSG $canale 8ln4: 0crea link a file e directory; \r\n";
print $net "PRIVMSG $canale 8pwd4: 0mostra la directory corrente; \r\n";
print $net "PRIVMSG $canale 8chmod4: 0modifica i permessi di accesso di un file; \r\n";
print $net "PRIVMSG $canale 8chown4: 0cambia il proprietario di un file; \r\n";
print $net "PRIVMSG $canale 8cat4: 0mostra il contenuto di un file; \r\n";
print $net "PRIVMSG $canale 8find4: 0cerca un file tra le directory; \r\n";

}

#Comandi
if ($srv=~ /^:(.+?)!(.+?)@(.+?) PRIVMSG $canale :.parte2/i){
print $net "PRIVMSG $canale 4.5:0Filesystem e processi4:5.\r\n";
print $net "PRIVMSG $canale 8df4: 0mostra lo spazio libero sul disco fisso;\r\n";
print $net "PRIVMSG $canale 8free4: 0mostra lo stato della memoria;\r\n";
print $net "PRIVMSG $canale 8mount4: 0monta un filesystem; \r\n";
print $net "PRIVMSG $canale 8unmount4: 0disattiva un filesystem; \r\n";
print $net "PRIVMSG $canale 8ps x4: 0visualizza un elenco dei processi correnti; \r\n";
print $net "PRIVMSG $canale 8kill4: 0invia un messaggio (TERM di default) ad un processo; \r\n";

}

#Comandi
if ($srv=~ /^:(.+?)!(.+?)@(.+?) PRIVMSG $canale :.parte3/i){
print $net "PRIVMSG $canale 4.5:0Sistema4:5.\r\n";
print $net "PRIVMSG $canale 8halt4: 0chiude il sistema;\r\n";
print $net "PRIVMSG $canale 8reboot4: 0riavvia il sistema;\r\n";
print $net "PRIVMSG $canale 8hostname4: 0mostra e cambia il nome dell'host; \r\n";

}

#Comandi
if ($srv=~ /^:(.+?)!(.+?)@(.+?) PRIVMSG $canale :.parte4/i){
print $net "PRIVMSG $canale 4.5:0Vari4:5.\r\n";
print $net "PRIVMSG $canale 8date4: 0mostra la data;\r\n";
print $net "PRIVMSG $canale 8gzip4: 0comprime e decomprime file .gz;\r\n";
print $net "PRIVMSG $canale 8tar4: 0crea backup di file (file .tar); \r\n";
print $net "PRIVMSG $canale 8reset4: 0resetta il terminale alle impostazioni iniziali; \r\n";
print $net "PRIVMSG $canale 8lynx4: 0browser web solo testo; \r\n";
print $net "PRIVMSG $canale 8zip e unzip4: 0comprime e decomprime file .zip; \r\n";
}

#Comandi
if ($srv=~ /^:(.+?)!(.+?)@(.+?) PRIVMSG $canale :.parte5/i){
print $net "PRIVMSG $canale 4.5:0Comandi Tecnici4:5.\r\n";
print $net "PRIVMSG $canale 8addgroup4: 0aggiunge un gruppo;\r\n";
print $net "PRIVMSG $canale 8adduser4: 0aggiunge un nuovo utente al sistema;\r\n";
print $net "PRIVMSG $canale 8cfdisk4: 0manipola graficamente le partizioni del disco fisso; \r\n";
print $net "PRIVMSG $canale 8chroot4: 0cambia la directory root e vi esegue un programma; \r\n";
print $net "PRIVMSG $canale 8groupdel4: 0elimina un gruppo di utenti; \r\n";
print $net "PRIVMSG $canale 8userdel4: 0elimina un utente del sistema; \r\n";
print $net "PRIVMSG $canale 8traceroute4: 0mostra il percorso per raggiungere un dato host; \r\n";
print $net "PRIVMSG $canale 8gedit /etc/apt/sources.list4: 0Edita le Repository; \r\n";
print $net "PRIVMSG $canale 8wget4: 0scarica file da pagine web e file da ftp; \r\n";
print $net "PRIVMSG $canale 8w4: 0mostra chi e' loggato e cosa sta facendo; \r\n";
print $net "PRIVMSG $canale 8whoami4: 0indica l'username con cui si e' attualmente loggati; \r\n";


}

#Comandi
if ($srv=~ /^:(.+?)!(.+?)@(.+?) PRIVMSG $canale :.parte6/i){
print $net "PRIVMSG $canale 4.5:0Comandi Utili4:5.\r\n";
print $net "PRIVMSG $canale 8info4: 0sistema di consultazione dei manuali tramite ipertesti;\r\n";
print $net "PRIVMSG $canale 8install4: 0copia dei file ed assegna permessi e proprietario;\r\n";
print $net "PRIVMSG $canale 8installpkg4: 0installa un pacchetto Slackware; \r\n";
print $net "PRIVMSG $canale 8irc4: 0client irc; \r\n";
print $net "PRIVMSG $canale 8ispell4: 0controllo grammaticale su un file; \r\n";
print $net "PRIVMSG $canale 8logname4: 0stampa il nome di login di un utente; \r\n";
print $net "PRIVMSG $canale 8lpr4: 0stampa un file; \r\n";
print $net "PRIVMSG $canale 8make4: 0GNU make; \r\n";
print $net "PRIVMSG $canale 8md5sum4: 0crea cecksum CRC di un file; \r\n";
print $net "PRIVMSG $canale 8perl4: 0interprete per script in linguaggio perl; \r\n";
print $net "PRIVMSG $canale 8sudo4: 0esegue un programma come superutente (root); \r\n";
print $net "PRIVMSG $canale 8telnet4: 0apre una sessione telnet; \r\n";
print $net "PRIVMSG $canale 8uuencode4: 0codifica un file binario in ASCII; \r\n";
print $net "PRIVMSG $canale 8wall4: 0invia un messaggio a tutti i terminali; \r\n";
print $net "PRIVMSG $canale 8wine4: 0consente di eseguire programmi Microsoft Windows in Linux; \r\n";


}


#Benvenuto
	if ($srv=~ /^:(Apache|Iis|Xitami|Causale|Unknow)|s0ld13r|.*JOIN.*/) {
print $net "PRIVMSG $canale $benvenuto\r\n";

}

#print STDOUT $srv;
}
print "\r\n";

################FINE SCRIPT################

