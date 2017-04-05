NAME=chag
VERSION=1.1.4
ITERATION=1.lru
PREFIX=/usr/local/bin
LICENSE=MIT
VENDOR="Michael Dowling"
MAINTAINER="Ryan Parman"
DESCRIPTION="Parses changelog entries; create annotated git tags from a changelog entry."
URL=https://github.com/mtdowling/chag

.PHONY: package
package:
	rm -f chag*
	wget -O chag https://raw.githubusercontent.com/mtdowling/$(NAME)/$(VERSION)/chag
	chmod +x chag

	fpm \
		-s dir \
		-t rpm \
		-n $(NAME) \
		-v $(VERSION) \
		-m $(MAINTAINER) \
		--iteration $(ITERATION) \
		--license $(LICENSE) \
		--vendor $(VENDOR) \
		--prefix $(PREFIX) \
		--url $(URL) \
		--description $(DESCRIPTION) \
		--rpm-defattrfile 0755 \
		--rpm-digest md5 \
		--rpm-compression gzip \
		--rpm-os linux \
		--rpm-auto-add-directories \
		chag \
	;

	mv *.rpm /vagrant/repo/
