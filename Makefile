patches=right_click_to_plumb.diff

all: download clone

download: $(patches)

right_click_to_plumb.diff:
	wget http://st.suckless.org/patches/right_click_to_plumb/right_click_to_plumb.diff
