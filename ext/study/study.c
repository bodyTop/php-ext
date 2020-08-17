/* study extension for PHP */

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include "php.h"
#include "ext/standard/info.h"
#include "php_study.h"

/* For compatibility with older PHP versions */
#ifndef ZEND_PARSE_PARAMETERS_NONE
#define ZEND_PARSE_PARAMETERS_NONE() \
	ZEND_PARSE_PARAMETERS_START(0, 0) \
	ZEND_PARSE_PARAMETERS_END()
#endif

//========================函数声明及实现===============================

/* {{{ void study_test1()
 */
PHP_FUNCTION(study_test1)
{
    ZEND_PARSE_PARAMETERS_NONE();
    php_printf("The extension %s is loaded and working!\r\n", "study");
}

PHP_FUNCTION(test)
{
    char *var;
    size_t var_len;
    char *str;
    size_t str_len;
    char *join = "&";
    size_t join_len;
    zend_string *retval;
    ZEND_PARSE_PARAMETERS_START(2, 3)
    Z_PARAM_STRING(var, var_len)
    Z_PARAM_STRING(str, str_len)
    Z_PARAM_OPTIONAL
    Z_PARAM_STRING(join,join_len)
    ZEND_PARSE_PARAMETERS_END();
    retval = strpprintf(0, "%s%s%s", var,join,str);
    RETURN_STR(retval);
}



/* }}}*/


/* {{{ arginfo
 */
ZEND_BEGIN_ARG_INFO(arginfo_study_test1, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO(arginfo_test, 0)
ZEND_ARG_INFO(0, var)
ZEND_ARG_INFO(0, str)
ZEND_ARG_INFO(0, join)
ZEND_END_ARG_INFO()
/* }}} */

//========================函数载入===============================

/* {{{ study_functions[]
 */
static const zend_function_entry study_functions[] = {
    PHP_FE(test,arginfo_test)
    PHP_FE(study_test1,		arginfo_study_test1)
	PHP_FE_END
};
/* }}} */


//======================phpinfo展示信息=============================
/* {{{ PHP_MINFO_FUNCTION
 */
PHP_MINFO_FUNCTION(study)
{
    php_info_print_table_start();
    php_info_print_table_header(2, "study support", "enabled");
    php_info_print_table_end();
}
/* }}} */

/* {{{ PHP_RINIT_FUNCTION
 */
PHP_RINIT_FUNCTION(study)
{
#if defined(ZTS) && defined(COMPILE_DL_STUDY)
    ZEND_TSRMLS_CACHE_UPDATE();
#endif
    return SUCCESS;
}
/* }}} */

//======================扩展声明周期执行函数定义=============================
/* {{{ study_module_entry
 */
zend_module_entry study_module_entry = {
	STANDARD_MODULE_HEADER,
	"study",					/* Extension name */
	study_functions,			/* zend_function_entry */
	NULL,							/* PHP_MINIT - Module initialization */
	NULL,							/* PHP_MSHUTDOWN - Module shutdown */
	PHP_RINIT(study),			/* PHP_RINIT - Request initialization */
	NULL,							/* PHP_RSHUTDOWN - Request shutdown */
	PHP_MINFO(study),			/* PHP_MINFO - Module info */
	PHP_STUDY_VERSION,		/* Version */
	STANDARD_MODULE_PROPERTIES
};
/* }}} */

#ifdef COMPILE_DL_STUDY
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif
ZEND_GET_MODULE(study)
#endif
