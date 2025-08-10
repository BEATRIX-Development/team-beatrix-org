md-files := $(shell find | grep .md)
html-files := $(addprefix ../site-build/,$(patsubst %.md,%.html,$(md-files)))

test:
	$(foreach \
		file, \
		$(md-files), \
		pandoc --standalone $(file) -o $(addprefix ../site-build/,$(patsubst %.md,%.html,$(file))) \
	)