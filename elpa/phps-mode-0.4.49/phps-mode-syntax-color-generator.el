;;; phps-mode-syntax-color-generator.el --- Data generation for syntax color -*- lexical-binding: t -*-

;; Copyright (C) 2018-2024  Free Software Foundation, Inc.


;;; Commentary:


;;; Code:


(defun phps-mode-syntax-color-generator--token-colors ()
  (let ((table (make-hash-table :test 'equal))
        (tokens '(
                  (END font-lock-doc-face table)
                  (T_ABSTRACT font-lock-keyword-face table)
                  (T_AMPERSAND_FOLLOWED_BY_VAR_OR_VARARG font-lock-keyword-face table)
                  (T_AMPERSAND_NOT_FOLLOWED_BY_VAR_OR_VARARG font-lock-keyword-face table)
                  (T_AND_EQUAL font-lock-constant-face table)
                  (T_ARRAY font-lock-keyword-face table)
                  (T_ARRAY_CAST font-lock-constant-face table)
                  (T_AS font-lock-keyword-face table)
                  (T_ATTRIBUTE font-lock-doc-face table)
                  (T_BOOLEAN_AND font-lock-constant-face table)
                  (T_BOOLEAN_OR font-lock-constant-face table)
                  (T_BOOLEAN_XOR font-lock-constant-face table)
                  (T_BOOL_CAST font-lock-constant-face table)
                  (T_BREAK font-lock-keyword-face table)
                  (T_CALLABLE font-lock-keyword-face table)
                  (T_CASE font-lock-keyword-face table)
                  (T_CATCH font-lock-keyword-face table)
                  (T_CLASS font-lock-keyword-face table)
                  (T_CLASS_C font-lock-constant-face table)
                  (T_CLONE font-lock-keyword-face table)
                  (T_CLOSE_TAG font-lock-constant-face table)
                  (T_COALESCE font-lock-constant-face table)
                  (T_COALESCE_EQUAL font-lock-constant-face table)
                  (T_COMMENT font-lock-doc-face table)
                  (T_CONCAT_EQUAL font-lock-constant-face table)
                  (T_CONST font-lock-keyword-face table)
                  (T_CONSTANT_ENCAPSED_STRING font-lock-string-face table)
                  (T_CONTINUE font-lock-keyword-face table)
                  (T_CURLY_OPEN font-lock-keyword-face table)
                  (T_DEC font-lock-constant-face table)
                  (T_DECLARE font-lock-keyword-face table)
                  (T_DEFAULT font-lock-keyword-face table)
                  (T_DIR font-lock-constant-face table)
                  (T_DIV_EQUAL font-lock-constant-face table)
                  (T_DNUMBER font-lock-string-face table)
                  (T_DO font-lock-keyword-face table)
                  (T_DOC_COMMENT font-lock-doc-face table)
                  (T_DOLLAR_OPEN_CURLY_BRACES font-lock-keyword-face table)
                  (T_DOUBLE_ARROW font-lock-constant-face table)
                  (T_DOUBLE_CAST font-lock-constant-face table)
                  (T_ECHO font-lock-keyword-face table)
                  (T_ELLIPSIS font-lock-constant-face table)
                  (T_ELSE font-lock-keyword-face table)
                  (T_ELSEIF font-lock-keyword-face table)
                  (T_EMPTY font-lock-keyword-face table)
                  (T_ENCAPSED_AND_WHITESPACE font-lock-string-face table)
                  (T_ENDDECLARE font-lock-keyword-face table)
                  (T_ENDFOR font-lock-keyword-face table)
                  (T_ENDFOREACH font-lock-keyword-face table)
                  (T_ENDIF font-lock-keyword-face table)
                  (T_ENDSWITCH font-lock-keyword-face table)
                  (T_ENDWHILE font-lock-keyword-face table)
                  (T_END_HEREDOC font-lock-constant-face table)
                  (T_ENUM font-lock-keyword-face table)
                  (T_ERROR font-lock-warning-face table)
                  (T_EVAL font-lock-keyword-face table)
                  (T_EXIT font-lock-keyword-face table)
                  (T_EXTENDS font-lock-keyword-face table)
                  (T_FILE font-lock-constant-face table)
                  (T_FINAL font-lock-keyword-face table)
                  (T_FINALLY font-lock-keyword-face table)
                  (T_FN font-lock-keyword-face table)
                  (T_FOR font-lock-keyword-face table)
                  (T_FOREACH font-lock-keyword-face table)
                  (T_FUNCTION font-lock-keyword-face table)
                  (T_FUNC_C font-lock-constant-face table)
                  (T_GLOBAL font-lock-keyword-face table)
                  (T_GOTO font-lock-keyword-face table)
                  (T_HALT_COMPILER font-lock-keyword-face table)
                  (T_IF font-lock-keyword-face table)
                  (T_IMPLEMENTS font-lock-keyword-face table)
                  (T_INC font-lock-constant-face table)
                  (T_INCLUDE font-lock-keyword-face table)
                  (T_INCLUDE_ONCE font-lock-keyword-face table)
                  (T_INLINE_HTML font-lock-preprocessor-face table)
                  (T_INSTANCEOF font-lock-keyword-face table)
                  (T_INSTEADOF font-lock-keyword-face table)
                  (T_INTERFACE font-lock-keyword-face table)
                  (T_INT_CAST font-lock-constant-face table)
                  (T_ISSET font-lock-keyword-face table)
                  (T_IS_EQUAL font-lock-constant-face table)
                  (T_IS_GREATER_OR_EQUAL font-lock-constant-face table)
                  (T_IS_IDENTICAL font-lock-constant-face table)
                  (T_IS_NOT_EQUAL font-lock-constant-face table)
                  (T_IS_NOT_IDENTICAL font-lock-constant-face table)
                  (T_IS_SMALLER_OR_EQUAL font-lock-constant-face table)
                  (T_LINE font-lock-constant-face table)
                  (T_LIST font-lock-keyword-face table)
                  (T_LNUMBER font-lock-string-face table)
                  (T_LOGICAL_AND font-lock-constant-face table)
                  (T_LOGICAL_OR font-lock-constant-face table)
                  (T_LOGICAL_XOR font-lock-constant-face table)
                  (T_MATCH font-lock-keyword-face table)
                  (T_METHOD_C font-lock-constant-face table)
                  (T_MINUS_EQUAL font-lock-constant-face table)
                  (T_MOD_EQUAL font-lock-constant-face table)
                  (T_MUL_EQUAL font-lock-constant-face table)
                  (T_NAMESPACE font-lock-keyword-face table)
                  (T_NAME_FULLY_QUALIFIED font-lock-variable-name-face table)
                  (T_NAME_QUALIFIED font-lock-variable-name-face table)
                  (T_NAME_RELATIVE font-lock-variable-name-face table)
                  (T_NEW font-lock-keyword-face table)
                  (T_NS_C font-lock-constant-face table)
                  (T_NS_SEPARATOR font-lock-keyword-face table)
                  (T_NULLSAFE_OBJECT_OPERATOR font-lock-keyword-face table)
                  (T_NUM_STRING font-lock-string-face table)
                  (T_OBJECT_CAST font-lock-constant-face table)
                  (T_OBJECT_OPERATOR font-lock-keyword-face table)
                  (T_OPEN_TAG font-lock-constant-face table)
                  (T_OPEN_TAG_WITH_ECHO font-lock-constant-face table)
                  (T_OR_EQUAL font-lock-constant-face table)
                  (T_PAAMAYIM_NEKUDOTAYIM font-lock-keyword-face table)
                  (T_PLUS_EQUAL font-lock-constant-face table)
                  (T_POW font-lock-constant-face table)
                  (T_POW_EQUAL font-lock-constant-face table)
                  (T_PRINT font-lock-keyword-face table)
                  (T_PRIVATE font-lock-keyword-face table)
                  (T_PROTECTED font-lock-keyword-face table)
                  (T_PUBLIC font-lock-keyword-face table)
                  (T_READONLY font-lock-keyword-face table)
                  (T_REQUIRE font-lock-keyword-face table)
                  (T_REQUIRE_ONCE font-lock-keyword-face table)
                  (T_RETURN font-lock-keyword-face table)
                  (T_SL font-lock-constant-face table)
                  (T_SL_EQUAL font-lock-constant-face table)
                  (T_SPACESHIP font-lock-constant-face table)
                  (T_SR font-lock-constant-face table)
                  (T_SR_EQUAL font-lock-constant-face table)
                  (T_START_HEREDOC font-lock-constant-face table)
                  (T_STATIC font-lock-keyword-face table)
                  (T_STRING font-lock-string-face table)
                  (T_STRING_CAST font-lock-constant-face table)
                  (T_STRING_VARNAME font-lock-variable-name-face table)
                  (T_SWITCH font-lock-keyword-face table)
                  (T_THROW font-lock-keyword-face table)
                  (T_TRAIT font-lock-keyword-face table)
                  (T_TRAIT_C font-lock-constant-face table)
                  (T_TRY font-lock-keyword-face table)
                  (T_UNSET font-lock-keyword-face table)
                  (T_UNSET_CAST font-lock-constant-face table)
                  (T_USE font-lock-keyword-face table)
                  (T_VAR font-lock-keyword-face table)
                  (T_VARIABLE font-lock-variable-name-face table)
                  (T_WHILE font-lock-keyword-face table)
                  (T_XOR_EQUAL font-lock-constant-face table)
                  (T_YIELD font-lock-keyword-face table)
                  (T_YIELD_FROM font-lock-keyword-face table))))
        (dolist (token-list tokens)
          (puthash (nth 0 token-list) (nth 1 token-list) table))
        table))

(defun phps-mode-syntax-color-generator--bookkeeping-tokens ()
  (let ((table (make-hash-table :test 'equal))
        (tokens '(T_STRING T_VARIABLE)))
    (dolist (token tokens)
      (puthash token t table))
    table))


(provide 'phps-mode-syntax-color-generator)