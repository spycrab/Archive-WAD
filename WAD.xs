#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <libwad.h>

MODULE = Archive::WAD		PACKAGE = Archive::WAD		

PROTOTYPES: DISABLE

TYPEMAP: << EOM

unsigned long long T_U_LONG_LONG
uint64_t T_U_LONG_LONG

INPUT
T_U_LONG_LONG
    $var = (unsigned long long)SvUV($arg)

OUTPUT
T_U_LONG_LONG
    sv_setuv($arg, (UV)$var);

EOM

const char* libwad_get_version_string()
ALIAS: get_version_string = 1

const char* libwad_get_error_msg()
ALIAS: get_error_msg = 1

int libwad_get_error()
ALIAS: get_error = 1

# util

const char* util_title_id_to_string(uint64_t title_id)
ALIAS: title_id_to_string = 1

# wad 

void* wad_open(const char* path)
POSTCALL: 
 if (RETVAL == 0)
  XSRETURN_UNDEF;

unsigned long wad_get_section_offset(void* handle, int type)

unsigned long wad_get_section_size(void* handle, int type)

void wad_close(void* handle)

# certchain

void* certchain_open(const char* path)
POSTCALL: if (RETVAL == 0) XSRETURN_UNDEF;

void certchain_close(void* handle)

void* wad_get_certchain(void* handle)

size_t certchain_get_cert_count(void* handle)

size_t certchain_get_private_key_length(int type)
# size_t certchain_get_signature_key_length(int type)

# tmd

void* tmd_open(const char* path)
POSTCALL: if (RETVAL == 0) XSRETURN_UNDEF;

void tmd_close(void* handle)

void* wad_get_tmd(void* handle)

uint64_t tmd_get_title_id(void* handle)

size_t tmd_get_content_count(void* handle)

uint64_t tmd_get_ios_version(void* handle)

uint64_t tmd_get_title_version(void* handle)

unsigned long tmd_get_title_region(void* handle)

const char* tmd_get_title_region_string(void* handle)

# ticket

void* ticket_open(const char* path)
POSTCALL: if (RETVAL == 0) XSRETURN_UNDEF;

void ticket_close(void* handle)

const char* ticket_get_issuer(void* handle)

unsigned long ticket_get_title_id(void* handle)

# data

void* data_open(const char* path)
POSTCALL: if (RETVAL == 0) XSRETURN_UNDEF;

void data_close(void* handle)
