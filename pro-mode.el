;; pro-mode.el
;; QT project
;; define several class of keywords
(setq mypro-keywords '("app" "lib" "vcapp" "vclib" "subdirs" "release" "debug" "warn_on" "warn_off" "qt" "thread" "x11" "windows" "console" "dll" "staticlib" "plugin" "else"))
(setq mypro-types '("win32" "unix"))
(setq mypro-constants '("TEMPLATE" "SOURCES" "HEADERS" "FORMS" "LEXSOURCES"	"TARGET" "DESTDIR" "DEFINES" "INCLUDEPATH" "VPATH" "DEF_FILE" "RC_FILE" "RES_FILE" "QT_DLL" "LIBS" "IMAGES" "OBJECTS_DIR" "MOC_DIR" "UI_DIR" "CONFIG"))
(setq mypro-events '("at_rot_target"))
(setq mypro-functions '("join" "prompt" "member" "find" "system" "contains"	"error" "exists" "equals" "include" "isEmpty" "message" "infile"))
;; create the regexp string for each class of keywords
(setq mypro-keywords-regexp (regexp-opt mypro-keywords 'words))
(setq mypro-type-regexp (regexp-opt mypro-types 'words))
(setq mypro-constant-regexp (regexp-opt mypro-constants 'words))
(setq mypro-event-regexp (regexp-opt mypro-events 'words))
(setq mypro-function-regexp (regexp-opt mypro-functions 'words))

;; clear memory
(setq mypro-keywords nil)
(setq mypro-types nil)
(setq mypro-constants nil)
(setq mypro-event nil)
(setq mypro-functions nil)

;; create the list for font-lock each class of
;; keyword is given a particular face
(setq mypro-font-lock-keywords
	  `(
		(,mypro-type-regexp . font-lock-type-face)
		(,mypro-constant-regexp . font-lock-constant-face)
		(,mypro-event-regexp . font-lock-builtin-face)
		(,mypro-function-regexp . font-lock-function-name-face)
		(,mypro-keywords-regexp . font-lock-keyword-face)))

;; define the mode
(define-derived-mode pro-mode fundamental-mode
  "pro mode"
  "Major mode for editing Qt Project file."

  ;; code for syntax highlighting
  (setq font-lock-defaults '((mypro-font-lock-keywords)))

  ;; clear memory
  (setq mypro-keywords-regexp nil)
  (setq mypro-type-regexp nil)
  (setq mypro-constant-regexp nil)
  (setq mypro-event-regexp nil)
  (setq mypro-function-regexp))

(provide 'pro-mode)
