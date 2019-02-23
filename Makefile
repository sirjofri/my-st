patches= \
	st-scrollback-20190122-3be4cf1.diff \
	st-hidecursor-0.8.1.diff \
	plumb_without_shell_OSC.diff \

nopatch= \
	st-iso14755-20180911-67d0cb6.diff \

src=source

patch: init
	for P in $(patches); do \
		echo " → Applying patch $$P"; \
		patch -d $(src) <$$P \
	; done
	cd $(src) && make config.h && \
	ed config.h <../sirjofri.ed

init: download
	git submodule update --init

install:
	cd $(src) && make clean install

download: $(patches)

st-iso14755-20180911-67d0cb6.diff:
	wget http://st.suckless.org/patches/iso14755/st-iso14755-20180911-67d0cb6.diff

plumb_without_shell_OSC.diff:
	wget http://st.suckless.org/patches/right_click_to_plumb/plumb_without_shell_OSC.diff

st-scrollback-20190122-3be4cf1.diff:
	wget http://st.suckless.org/patches/scrollback/st-scrollback-20190122-3be4cf1.diff

st-hidecursor-0.8.1.diff:
	wget http://st.suckless.org/patches/hidecursor/st-hidecursor-0.8.1.diff

clean:
	- rm -Rf $(src)

.PHONY: init download install patch clean
