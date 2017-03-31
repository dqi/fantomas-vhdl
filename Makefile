.PHONY: clean
GHDL=ghdl
GHDLFLAGS=--ieee=synopsys

CORE_OBJ=\
	fantomas_key.o \
	fantomas_rc.o \
	fantomas_state_machine.o \
	fantomas_core.o \
	fantomas_sbox.o \
	fantomas_subbytes.o\
	fantomas_lbox.o \
	fantomas_llayer.o
TB_CORE=tb_fantomas_core

STATE_OBJ=\
	fantomas_state_machine.o
TB_STATE=tb_fantomas_state_machine

LLAY_OBJ=\
	fantomas_lbox.o \
	fantomas_llayer.o
TB_LLAY=tb_fantomas_llayer

SUBB_OBJ=\
	fantomas_sbox.o \
	fantomas_subbytes.o
TB_SUBB=tb_fantomas_subbytes

RC_OBJ=\
	fantomas_rc.o
TB_RC=tb_fantomas_rc

SBOX_OBJ=\
	 fantomas_sbox.o
TB_SBOX=tb_fantomas_sbox

LBOX_OBJ=\
	fantomas_lbox.o
TB_LBOX=tb_fantomas_lbox


test_state: $(STATE_OBJ)
	$(GHDL) -a $(GHDLFLAGS) $(TB_STATE).vhd
	$(GHDL) -e $(GHDLFLAGS) $(TB_STATE)
	$(GHDL) -r $(GHDLFLAGS) $(TB_STATE) --wave=$(TB_STATE).ghw

test_core: $(CORE_OBJ)
	$(GHDL) -a $(GHDLFLAGS) $(TB_CORE).vhd
	$(GHDL) -e $(GHDLFLAGS) $(TB_CORE)
	$(GHDL) -r $(GHDLFLAGS) $(TB_CORE) --wave=$(TB_CORE).ghw

test_llay: $(LLAY_OBJ)
	$(GHDL) -a $(GHDLFLAGS) $(TB_LLAY).vhd
	$(GHDL) -e $(GHDLFLAGS) $(TB_LLAY)
	$(GHDL) -r $(GHDLFLAGS) $(TB_LLAY) --wave=$(TB_LLAY).ghw

test_subb: $(SUBB_OBJ)
	$(GHDL) -a $(GHDLFLAGS) $(TB_SUBB).vhd
	$(GHDL) -e $(GHDLFLAGS) $(TB_SUBB)
	$(GHDL) -r $(GHDLFLAGS) $(TB_SUBB) --wave=$(TB_SUBB).ghw

test_rc: $(RC_OBJ)
	$(GHDL) -a $(GHDLFLAGS) $(TB_RC).vhd
	$(GHDL) -e $(GHDLFLAGS) $(TB_RC)
	$(GHDL) -r $(GHDLFLAGS) $(TB_RC) --wave=$(TB_RC).ghw

test_lbox: $(LBOX_OBJ)
	$(GHDL) -a $(GHDLFLAGS) $(TB_LBOX).vhd
	$(GHDL) -e $(GHDLFLAGS) $(TB_LBOX)
	$(GHDL) -r $(GHDLFLAGS) $(TB_LBOX) --wave=$(TB_LBOX).ghw

test_sbox: $(SBOX_OBJ)
	$(GHDL) -a $(GHDLFLAGS) $(TB_SBOX).vhd
	$(GHDL) -e $(GHDLFLAGS) $(TB_SBOX)
	$(GHDL) -r $(GHDLFLAGS) $(TB_SBOX) --wave=$(TB_SBOX).ghw

# Binary depends on the object file
%: %.o
	$(GHDL) -e $(GHDLFLAGS) $@

# Object file depends on source
%.o: %.vhd
	$(GHDL) -a $(GHDLFLAGS) $<

clean:
	@echo "Cleaning up..."
	rm -f *.o
	rm -f *.ghw
	rm -f *.vcd
	rm -f work*.cf
