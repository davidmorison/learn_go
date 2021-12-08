TARG=foo
CGOFILES=foo.go
include $(GOROOT)/src/Make.$(GOARCH)
include $(GOROOT)/src/Make.pkg
foo.o:foo.cpp
	g++ $(_CGO_CFLAGS_$(GOARCH)) -fPIC -O2 -o $@ -c $(CGO_CFLAGS) $<
cfoo.o:cfoo.cpp
	g++ $(_CGO_CFLAGS_$(GOARCH)) -fPIC -O2 -o $@ -c $(CGO_CFLAGS) $<
CGO_LDFLAGS+=-lstdc++
$(elem)_foo.so: foo.cgo4.o foo.o cfoo.o
	gcc $(_CGO_CFLAGS_$(GOARCH)) $(_CGO_LDFLAGS_$(GOOS)) -o $@ $^ $(CGO_LDFLAGS)

