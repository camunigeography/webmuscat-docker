# Requires 32-bit support; Ubuntu 20.04 or later will not work
FROM ubuntu:18.04

#WORKDIR /

# Update
RUN apt-get update

# Apache
RUN apt-get install -y apache2
RUN a2enmod cgid

# i386 (32-bit) subsystem and required libc6 package
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y install libc6:i386

# Libraries (these are very old libraries copied from an old machine)
COPY files/libc.so.5.3.12 /lib/libc.so.5
COPY files/libdl.so.1.7.14 /lib/libdl.so.1

# Muscat FX
# Unpack the software distribution into /usr/local/ ; the program will then be will then be at /usr/local/MuscatFX/src/muscat/
# NB the version of fx.sp seems to be different to that in /websites/software/muscat/ (probably fx.sp means a SPRI-customised version of the fx program)
# The configuration file points to the installation
ADD files/fx-linux-1.4.4.tar /usr/local/
COPY files/muscat-fx.cf /etc/muscat-fx.cf

# Perl and CPAN; modules as defined in /usr/local/MuscatFX/muscat-install
RUN apt-get -y install perl
RUN cpan install Carp Getopt::Std Socket Exporter

# CGI files
COPY files/fx.sp /usr/lib/cgi-bin/
COPY files/fx.sp.wrapper /usr/lib/cgi-bin/

# Run Apache
CMD /usr/sbin/apache2ctl -D FOREGROUND

