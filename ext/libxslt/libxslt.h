/* $Id: libxslt.h 43 2007-12-07 12:38:59Z transami $ */

/* Please see the LICENSE file for copyright and distribution information */

#ifndef __RUBY_LIBXSLT_H__
#define __RUBY_LIBXSLT_H__

#include <ruby.h>
#include <rubyio.h>
#include <libxml/parser.h>
#include <libxml/debugXML.h>
#include <libxslt/extra.h>
#include <libxslt/xslt.h>
#include <libxslt/xsltInternals.h>
#include <libxslt/transform.h>
#include <libxslt/xsltutils.h>
#include <libexslt/exslt.h>

// Includes from libxml-ruby
#include <libxml/ruby_libxml.h>
#include <libxml/ruby_xml_document.h>


#include "ruby_xslt_stylesheet.h"
#include "ruby_xslt_transform_context.h"

#include "version.h"

#define RUBY_LIBXSLT_SRC_TYPE_NULL    0
#define RUBY_LIBXSLT_SRC_TYPE_FILE    1

extern VALUE mXML;
//extern VALUE cXMLDocument;

extern VALUE cXSLT;
extern VALUE eXMLXSLTStylesheetRequireParsedDoc;

typedef struct ruby_xslt {
  int data_type;
  void *data;
  VALUE str;
  VALUE xml_doc_obj;
  VALUE ctxt;
  xsltStylesheetPtr xsp;
} ruby_xslt;

#if ((RUBY_LIBXML_VER_MAJ != RUBY_LIBXSLT_VER_MAJ) || (RUBY_LIBXML_VER_MIN != RUBY_LIBXSLT_VER_MIN))
#error "Incompatible LibXML-Ruby headers - please install same major/micro version"
#endif

#endif
