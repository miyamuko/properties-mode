; -*- Mode: Lisp; Package: editor -*-

#|
= properties-mode - Java �� properties �t�@�C����ҏW�����肷��

* Author:  MIYAMUKO Katsuyuki ((<URL:mailto:miyamuko@gmail.com>))
* URL: ((<URL:http://miyamuko.s56.xrea.com/xyzzy/properties-mode/intro.htm>))
* Version: $Id: properties-mode.l,v 1.15 2005/07/06 12:47:54 miyamuko Exp $


== ����

Java �� properties �t�@�C����ҏW���邽�߂̃��[�h�ł��B

* ���[�h���� ((% native2ascii -reverse %)) ������Ɏ��s
* �ۑ����� ((% native2ascii %)) ������Ɏ��s
* �K���ȃC���f���g
* �K���ȐF�Â�
* �O�̃L�[���R�s�[�ł���
* �J�����̎�������


== �C���X�g�[��

((<NetInstaller|URL:http://www.mirai.ne.jp/~gyo/xyzzy/ni.html>)) �ŃC���X�g�[�������ꍇ�� 3 �ȍ~���A
NetInstaller + (({ni-autoload})) ���g���Ă���l�� 4 �ȍ~�� OK �ł��B

(1) �A�[�J�C�u���_�E�����[�h���܂��B

    ((<URL:http://miyamuko.s56.xrea.com/xyzzy/archives/properties-mode.zip>))

(2) �A�[�J�C�u��W�J���āA$XYZZY/site-lisp �z���Ƀt�@�C�����R�s�[���܂��B

(3) �g���q�� properties �̃t�@�C�����J�����Ƃ��Ɏ����I�� properties-mode �ɂȂ�悤��
    ~/.xyzzy �܂��� $XYZZY/site-lisp/siteinit.l �Ɉȉ��̃R�[�h��ǉ����܂��B

        ;; properties-mode
        (load-library "properties-mode")
        (pushnew '("\\.properties$" . properties-mode) *auto-mode-alist* :test 'equal)

(4) �ݒ�𔽉f������ɂ� xyzzy ���ċN�����Ă��������B

    ��siteinit.l �ɋL�q�����ꍇ�ɂ͍ă_���v���K�v�ł��B


== ���t�@�����X

=== �L�[���蓖��

: ((%TAB%))
    �C���f���g����B

    * �p���s�Ȃ� value �̊J�n�ƃC���f���g�����낦�܂��B
    * �v���p�e�B���p�����镶�����Ȃ��ꍇ�A�ʏ�C���f���g���܂���B

    �v���p�e�B�𕡐��s�ɂ킽���ď����ꍇ�͎��̂悤�ɒl�̐擪�����낦��悤��
    �C���f���g���܂��B

        font = family1 family2 family3 family4 \
               - size1 size2 size3 size4 size5 \
               - bold italic underline

    key �̒���ŉ��s�����ꍇ�͎��̂悤�ɃC���f���g���܂��B
    ((({*properties-indent-level*})) �� 2 �̏ꍇ)

        fontLabel=\
          Font

: ((%RET%))
    ���s�{�C���f���g�t���B

: ((%C-M-\%))
    �O�̃L�[���R�s�[����B

    �A�����Ď��s����Ƃ����̂ڂ��ăL�[���R�s�[���Ă��܂��B

: ((%C-c n%))
    ���[�W������ ((%native2ascii -reverse%)) ���܂��B

: ((%C-c a%))
    ���[�W������ ((%native2ascii%)) ���܂��B

: ((%C-c C-a%))
    ���[�W�����̃v���p�e�B�̃J���������낦�܂��B

    * before

          a.b=      c
          a b
          a.b.c: d

    * after

          a.b   =     c
          a           b
          a.b.c :     d

: ((%C-c C-o%))
    ���[�W�����̃Z�p���[�^����̗]�v�ȋ󔒂��������܂��B

    * before

          a.b  = c
          a      b

    * after

          a.b=c
          a b

: ((%C-c C-c%))
    ���[�W�������R�����g�A�E�g���܂��B

: ((%C-c C-u%))
    ���[�W�������R�����g�������܂��B

: ((%C-/%))
    ���ݍs�̃R�����g�E��R�����g��؂�ւ��܂��B

: ((%C-c C-s C-v%))
    �o�b�t�@�S�̂� csv �ɕϊ����܂��B

    ((<csv-mode|URL:http://members.tripod.co.jp/ohkubo/xyzzy/#csv-mode>))
    ���C���X�g�[������Ă��� (({*properties-auto-csv-mode*})) ��
    ((|non-nil|)) �̏ꍇ�A�ϊ��㎩���I�� csv-mode �����s���܂��B

=== �ϐ�

--- *properties-indent-level*
    �p���s�̃C���f���g����ݒ肵�܂��B
    �f�t�H���g�l�� 2 �ł��B

      properties.key = \
      ____properties.value

    ��:

      ;; �C���f���g���� 4 �ɂ���
      (setq *properties-indent-level* 4)

--- *properties-n2a-buffer-name*
    native2ascii �������ʂ̃o�b�t�@���ł��B

--- *properties-auto-csv-mode*
    (({properties-convert-to-csv})) �����s�����Ƃ��Ɏ����I��
    csv-mode �ɂ��邩�ǂ����̃t���O�ł��B

    ((|non-nil|)) ���� csv-mode ���C���X�g�[������Ă���ꍇ�A
    �����I�� csv-mode �ɂ��܂��B

    �f�t�H���g�� t �ł��B

--- *properties-auto-native2ascii*
    �����I�� native2ascii �����s���邩�ǂ����̃t���O�ł��B

    ((|non-nil|)) �Ȃ烍�[�h���E�ۑ����Ɏ����I�� native2ascii ���܂��B

    �f�t�H���g�� t �ł��B

== ���ꂩ���邩������Ȃ�����

* �t�@�C�����J������ԂŊO���Ńt�@�C�����X�V�����ꍇ�� ascii2native ����Ȃ��B
* �L�[���d�������ꍇ�͌x������
* ���̃��P�[���̃��\�[�X�ƈ����̐����Ⴄ�ꍇ�͌x��
* ���̃��P�[���̃��\�[�X���ȒP�ɊJ����
* ���̃��P�[���̃��\�[�X�̓��e�� popup
* �����̃��P�[���̃��\�[�X���܂Ƃ߂� csv �ɕϊ�
* �L�[���\�������ăc���[�\��

== �֘A���邩������Ȃ��y�[�W

: java.util.properties#load
    ((<URL:http://java.sun.com/j2se/1.4/ja/docs/ja/api/java/util/Properties.html#load(java.io.InputStream)>))

== ���C�Z���X

properties-mode �͏C�� BSD ���C�Z���X�Ɋ�Â��ė��p�\�ł��B

  Copyright (C) 2003-2004 MIYAMUKO Katsuyuki. All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met:

  1 Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimer as the first lines
    of this file unmodified.

  2 Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  SUCH DAMAGE.
|#


(provide "properties-mode")
(in-package "editor")
(export '(*properties-mode-hook*
          *properties-mode-map*
          *properties-comment-column*
          *properties-indent-level*
          *properties-n2a-buffer-name*
          *properties-auto-csv-mode*
          *properties-auto-native2ascii*
          *properties-auto-native2ascii-exclude-list*

          properties-ascii-to-native-region
          properties-native-to-ascii-region
          properties-external-ascii-to-native-region
          properties-external-native-to-ascii-region
          properties-internal-ascii-to-native-region
          properties-internal-native-to-ascii-region

          properties-toggle-auto-n2a
          properties-completion
          properties-adjust-property
          properties-optimize-property
          properties-comment-toggle-line
          properties-comment-region
          properties-uncomment-region
          properties-convert-to-csv
          properties-mode))

; �t�b�N
(defvar *properties-mode-hook* nil
  "properties-mode: �t�b�N�ϐ�")

; configuration
(defvar *properties-comment-column* nil
  "properties-mode: comment �̂Ȃɂ�")

(defvar *properties-indent-level* 2
  "properties-mode: value ���Ȃ��ꍇ�̌p���s�̃C���f���g���x��
   key = \\
   __<- hear!")

(defvar *properties-n2a-buffer-name* "*native2ascii*"
  "native2ascii ����Ƃ��̃o�b�t�@��")

(defvar *properties-auto-csv-mode* t
  "non-nil: properties-convert-to-csv �����Ƃ��Ɏ����I�� csv-mode �ɂ���B")

(defvar-local *properties-auto-native2ascii* t
  "non-nil: �ǂݍ��݁E�ۑ����� native2ascii �����I����B
nil: �ǂݍ��݁E�ۑ����ɂȂɂ����Ȃ��B")

(defvar *properties-auto-native2ascii-exclude-list* nil
  "properties-mode: �����I�� native2ascii ���珜�O���郊�X�g")

;; ----------------------------------------------------------------------
;; regex pattern

(defvar *properties-escaped-char-pattern*
  "\\\\\\(?:.\\|\n\\)"
  "properties-mode: escape ���������̃p�^�[���B
���s���G�X�P�[�v�����ꍇ���s�̍s���̋󔒂͖��������B")

; �������̂��ߍs���ɋ󔒂�����L�[�͖���
(defvar *properties-key-pattern*
  (concat "^\\("
          "\\(?:" "[^#!:= \t\r\n\\]" "\\|" *properties-escaped-char-pattern* "\\)"
          "\\(?:" "[^:= \t\r\n\\]" "\\|" *properties-escaped-char-pattern* "\\)*"
          "\\)")
  "properties-mode: key �̃p�^�[��, $1 = key")

(defvar *properties-arguments-pattern*
  "\\({[^}\n]+}\\)"
  "properties-mode: MessageFormat �̈��� ({0} �Ƃ�) �̃p�^�[��, $1 = arg")

(defvar *properties-separator-pattern*
  "\\([ \t]*[:=][ \t]*\\|[ \t]+\\)"
  "properties-mode: separator �̃p�^�[��, $1 = separator")

(defvar *properties-value-pattern*
  (concat "\\("
          "\\(?:" "[^\r\n\\]" "\\|" *properties-escaped-char-pattern* "\\)+"
          "\\)")
  "properties-mode: value �̃p�^�[��, $1 = value")

(defvar *properties-pattern*
  (concat *properties-key-pattern*
          "\\(?:" *properties-separator-pattern* "\\)?"
          "\\(?:" *properties-value-pattern* "\\)?")
  "properties-mode: key = value �̃p�^�[��, $1 = key, $2 = separator, $3 = value")

;; ----------------------------------------------------------------------
;; keyword
(defvar *properties-key-color* '(:keyword 0)
  "properties-mode: key �̐F")

(defvar *properties-arguments-color* '(:keyword 2)
  "properties-mode: MessageFormat �̈��� ({0} �Ƃ�) �̐F")

(defvar *properties-regexp-keyword-list* nil
  "properties-mode: ���K�\���L�[���[�h���X�g")

(setq *properties-regexp-keyword-list*
  (compile-regexp-keyword-list
   `(
     ; key ���� arguments �� key �̐F�ɂ������̂� arguments ���ɂ���
     (,*properties-arguments-pattern* t ((1 . ,*properties-arguments-color*)))
     (,(concat *properties-key-pattern*) t ((1 . ,*properties-key-color*)))
     )))

;; ----------------------------------------------------------------------
;; �V���^�b�N�X�e�[�u��
(defvar *properties-mode-syntax-table* nil)
(unless *properties-mode-syntax-table*
  (setq *properties-mode-syntax-table* (make-syntax-table))
  (do ((x #x21 (1+ x))) ((>= x #x7f))
    (let ((c (code-char x)))
      (unless (alphanumericp c)
        (set-syntax-punctuation *properties-mode-syntax-table* c))))
  ; �ȉ�mode�ɍ��킹�Đݒ�
  (set-syntax-escape *properties-mode-syntax-table* #\\)
  (set-syntax-start-comment *properties-mode-syntax-table* #\#)
  (set-syntax-start-comment *properties-mode-syntax-table* #\!)
  (set-syntax-end-comment *properties-mode-syntax-table* #\LFD))

; �L�[�}�b�v
(defvar *properties-mode-map* nil)
(unless *properties-mode-map*
  (setq *properties-mode-map* (make-sparse-keymap))
  ; �ȉ��L�[����
  (define-key *properties-mode-map* #\C-h 'backward-delete-char-untabify-or-selection)
  (define-key *properties-mode-map* #\TAB 'properties-indent-line)
  (define-key *properties-mode-map* #\C-M-q 'indent-sexp)
  (define-key *properties-mode-map* #\C-M-\, 'properties-copy-key)
  (define-key *properties-mode-map* #\RET 'properties-newline-and-indent)
  (define-key *properties-mode-map* #\\ 'properties-electric-insert)
  (define-key *properties-mode-map* '(#\C-c #\n) 'properties-ascii-to-native-region)
  (define-key *properties-mode-map* '(#\C-c #\a) 'properties-native-to-ascii-region)
  (define-key *properties-mode-map* '(#\C-c #\C-a) 'properties-adjust-property)
  (define-key *properties-mode-map* '(#\C-c #\C-o) 'properties-optimize-property)
  (define-key *properties-mode-map* '(#\C-c #\C-c) 'properties-comment-region)
  (define-key *properties-mode-map* '(#\C-c #\C-u) 'properties-uncomment-region)
  (define-key *properties-mode-map* '(#\C-c #\C-s #\C-v) 'properties-convert-to-csv)
  (define-key *properties-mode-map* '(#\C-/) 'properties-comment-toggle-line)
  )

;; ----------------------------------------------------------------------
;; �ǂݍ��ݎ��A���[�h���� narive2ascii �����s����

(defvar *properties-n2a-buffer* nil)
(defvar *properties-n2a-fn* 'properties-internal-native-to-ascii-region)
(defvar *properties-a2n-fn* 'properties-internal-ascii-to-native-region)

(defun properties-ascii-to-native-region (start end)
  (interactive "*r")
  (funcall *properties-a2n-fn* start end))

(defun properties-native-to-ascii-region (start end)
  (interactive "*r")
  (funcall *properties-n2a-fn* start end))

;; native2ascii.exe ���Ăяo��
(defun properties-external-ascii-to-native-region (start end)
  (interactive "*r")
  (filter-region "native2ascii.exe -reverse" start end))

(defun properties-external-native-to-ascii-region (start end)
  (interactive "*r")
  (filter-region "native2ascii.exe" start end))

;; ���� native2ascii
(defun properties-internal-ascii-to-native-region (start end)
  (interactive "*r")
  (properties-filter-region 'properties-map-unicode-escape-to-sjis start end))

(defun properties-internal-native-to-ascii-region (start end)
  (interactive "*r")
  (properties-filter-region 'properties-map-sjis-to-unicode-escape start end))

(defun properties-filter-region (fn start end)
  (if (< end start) (rotatef start end))
  (let ((str (buffer-substring start end))
        (opoint (point)))
    (delete-region start end)
    (insert (funcall fn str))
    (goto-char opoint)))

;; \u3042   => ��
;; \\u3042  => \\u3042
;; \\\u3042 => \\��
;; \uxxxx => \uxxxx
(defun properties-map-unicode-escape-to-sjis (str)
  (let ((result) (start 0))
    (while (< start (length str))
      (cond ((string-looking-at "\\(\\\\+\\)u\\([a-f0-9]\\{4\\}\\)" str :start start :case-fold t)
             (cond ((and (= (mod (length (match-string 1)) 2) 1) ;; \ �̐������
                         (characterp (unicode-char (parse-integer (match-string 2) :radix 16))))
                    (push (substring (match-string 1) 1) result)
                    (push (unicode-char (parse-integer (match-string 2) :radix 16)) result))
                   (t
                    (push (match-string 0) result)))
             (setf start (match-end 0)))
            (t
             (push (char str start) result)
             (incf start))))
    (format nil "~{~A~}" (reverse result))))

(defun properties-map-sjis-to-unicode-escape (str)
  (format nil "~{~A~}"
          (map 'list #'properties-map-sjis-to-unicode-escape0 str)))

(defun properties-map-sjis-to-unicode-escape0 (ch)
  (if (<= 0 (char-unicode ch) #xff)
      (format nil "~A" ch)
    (format nil "\\u~:@(~X~)" (char-unicode ch))))

;;

(defun properties-native2ascii-p ()
  (and (properties-auto-native2ascii-p)
       (properties-contain-multibyte-char-p)))

(defun properties-ascii2native-p ()
  (and (properties-auto-native2ascii-p)
       (not (properties-contain-multibyte-char-p))
       (properties-contain-unicode-char-p)))

(defun properties-auto-native2ascii-p ()
  (and *properties-auto-native2ascii*
       (not (properties-auto-native2ascii-exclude-file-p))))

(defun properties-auto-native2ascii-exclude-file-p ()
  (when (get-buffer-file-name)
    (find (get-buffer-file-name) *properties-auto-native2ascii-exclude-list*
          :test #'(lambda (item exclude)
                    (string-matchp (map-backslash-to-slash exclude)
                                   (map-backslash-to-slash item))))))

(defun properties-contain-multibyte-char-p ()
  "�R�����g�ȊO�Ƀ}���`�o�C�g�������܂܂�Ă���� t"
  (save-excursion
    (beginning-of-buffer)
    (while (scan-buffer "[^\x00-\x7f]" :regexp t :tail t)
      (unless (eq (parse-point-syntax) :comment)
        (return-from properties-contain-multibyte-char-p t)))
    nil))

(defun properties-contain-unicode-char-p ()
  "Unicode ���� (\uxxxx) ���܂܂�Ă���� t"
  (save-excursion
    (beginning-of-buffer)
    (scan-buffer "\\u[a-f0-9]\\{4\\}" :regexp t :case-fold t)))

(defun properties-on-load ()
  "�t�@�C���ǂݍ��ݎ��ɌĂяo���B
   �}���`�o�C�g�������܂܂�Ă��Ȃ��ꍇ�� ascii2native ���ăo�b�t�@�̍X�V�������C������"
  (if (properties-ascii2native-p)
      (progn
        (message "ascii2native")
        (properties-ascii-to-native-region (point-min) (point-max))
        (update-visited-file-modtime)
        (set-buffer-modified-p nil))
    (properties-toggle-auto-n2a nil)))

(defun properties-save-buffer ()
  "native2ascii ���ĕۑ�����"
  (interactive "*")
  (unless (properties-native2ascii-p)
    (return-from properties-save-buffer nil))
  (let ((current-buffer (selected-buffer))
        (content (properties-get-buffer-content))
        (filename (get-buffer-file-name)))
    (unwind-protect
        (progn
          (set-buffer (properties-n2a-buffer))
          (properties-set-buffer-content content)
          (properties-native-to-ascii-region (point-min) (point-max))
          (write-file filename))
      (set-buffer current-buffer))
    (update-visited-file-modtime)
    (set-buffer-modified-p nil)
    t))

(defun properties-set-buffer-content (content)
  "current buffer �̓��e��u��������"
  (save-restriction
    (widen)
    (erase-buffer (selected-buffer))
    (insert content)))

(defun properties-get-buffer-content ()
  "current buffer �̑S���e���擾����"
  (save-restriction
    (widen)
    (buffer-substring (point-min) (point-max))))

(defun properties-n2a-buffer ()
  "properties-mode: n2a �o�b�t�@�̎擾"
  (unless (and *properties-n2a-buffer*
               (find-buffer *properties-n2a-buffer-name*))
    (when (setq *properties-n2a-buffer*
                (switch-to-buffer *properties-n2a-buffer-name*))
      (setup-temp-buffer *properties-n2a-buffer*)))
  *properties-n2a-buffer*)

(defun properties-toggle-auto-n2a (&optional (flag (not *properties-auto-native2ascii*)))
  (interactive)
  (setf *properties-auto-native2ascii* flag)
  (message "auto native2ascii: ~A" (if *properties-auto-native2ascii* "on" "off")))

;;
;(defun properties-buffer-modified-hook (buffer operation from to undo-p)
;  (message "~S ~S ~S ~S ~S" buffer operation from to undo-p))

;; ----------------------------------------------------------------------
;; �O�̃L�[���R�s�[����
;;   �A�����ăR�}���h�����s�����ꍇ�����̂ڂ��ăR�s�[����
(defvar-local *properties-copy-last-line* nil)
(defvar-local *properties-copy-dst-point* nil)
(defun properties-copy-key ()
  "properties-mode: �O�̃L�[���R�s�[����"
  (interactive "*")
  (let ((key nil))
    (save-excursion
      (cond
       ;; ���̃R�}���h�A�����Ď��s���Ă���
       ((and (eq *last-command* 'properties-copy-key)
             (integerp *properties-copy-last-line*))
        (goto-line *properties-copy-last-line*)
        (clear-undo-boundary))

       ;; ������s
       (t
        (setf *properties-copy-dst-point* (point))))

      (when (and (properties-previous-line)
                 (scan-buffer *properties-pattern* :regexp t))
        (setf key (match-string 1))
        (setf *properties-copy-last-line* (current-line-number))))

    (unless key
      (message "�����Ȃ��ł��B")
      (return-from properties-copy-key))

    (delete-region *properties-copy-dst-point* (point))
    (insert key)))

;; ----------------------------------------------------------------------
;; ���[�W�����̃v���p�e�B�̃J���������낦��

(defun properties-adjust-property (start end)
  (interactive "*r")
  (if (< end start) (rotatef start end))

  (let ((key-width 0) (sep-width 0)
        (key nil) (sep nil) (value nil))
    (save-excursion
      (save-restriction
        (narrow-to-region start end)

        ;; �C���f���g���Ă���
        (indent-region start end)

        ;; �Œ��̃J�������擾
        ;;   key  =  value
        ;;   <--->    : key-width
        ;;        <-> : sep-width
        (goto-char (point-min))
        (while (scan-buffer *properties-pattern* :regexp t :tail t)
          (setf key (match-string 1))
          (setf sep (match-string 2))
          (setf value (match-string 3))

          (when (and key sep)
            (when (<= key-width (+ (length key) (or (string-match "[:=]" sep) 0)))
              (setf key-width (+ (length key) (or (string-match "[:=]" sep) 0)))
              (if (string-match "^[:=]" sep) (incf key-width))))
          (when (and sep value)
            (when (<= sep-width (- (length sep) (or (string-match "[:=]" sep) (length sep))))
              (setf sep-width (- (length sep) (or (string-match "[:=]" sep) (length sep))))
              (if (string-match "[:=]$" sep) (incf sep-width))))
          )

        ;; �Z�p���[�^���󔒕����݂̂̏ꍇ�� sep-width �� 0 �Ȃ̂� 1 ��ݒ�
        (if (zerop sep-width) (setf sep-width 1))

        ;; �ŁA����ɂ��킹��
        (goto-char (point-min))
        (while (scan-buffer *properties-pattern* :regexp t :tail t)
          (setf key (match-string 1))
          (setf sep (string-trim " \t\r\f\n" (match-string 2)))
          (setf value (match-string 3))

          (when (and key sep)
            (delete-region (match-beginning 0) (match-end 0))
            (insert (format nil
                            (format nil "~~~D@A~~~D@A~~A" key-width sep-width)
                            key sep (or value "")))))

        ;; �C���f���g���Ă���
        (indent-region (point-min) (point-max))
        ))))

;; ----------------------------------------------------------------------
;; ���[�W�����̃Z�p���[�^����̋󔒂��폜

(defun properties-optimize-property (start end)
  (interactive "*r")
  (if (< end start) (rotatef start end))

  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char (point-min))
      (while (scan-buffer *properties-pattern* :regexp t)
        (let ((key (match-string 1))
              (sep (match-string 2))
              (val (match-string 3)))
          (when (and key sep)
            (delete-region (match-beginning 0) (match-end 0))
            (insert (format nil "~A~A~A"
                            key
                            (funcall #'(lambda (str) (if (equal str "") " " str))
                                     (string-trim " \t\r\f\n" sep))
                            (or val "")))))))
    ;; �C���f���g���Ă���
    (indent-region start end)
    ))

;; ----------------------------------------------------------------------
;; �}�[�N�s���猻�ݍs�܂ł� csv �ɕϊ�
(defvar *properties-buffer-convert* "*Properties Convert*")
(defun properties-convert-to-csv ()
  (interactive)

  (let ((in-buffer (selected-buffer)))
    (save-excursion
      (with-output-to-temp-buffer (*properties-buffer-convert*)
        (set-buffer in-buffer)
        (goto-char (point-min))
        (while (scan-buffer *properties-pattern* :regexp t :tail t)
          (let ((key (match-string 1))
                (val (match-string 3)))
            (when (and key val)
              (format t "~A,~A~%"
                      (properties-escape-csv (properties-unescape-property key))
                      (properties-escape-csv (properties-unescape-property val))))
            ))
        ))

    ;; csv-mode �ɂ���
    (when (and *properties-auto-csv-mode*
               (find-load-path "csv-mode"))
      (set-buffer *properties-buffer-convert*)
      (require "csv-mode")
      (csv-mode))))

;; \ " '  ! # : = �̓G�X�P�[�v���ď������܂�Ă���B
;; CR LF TAB ���G�X�P�[�v����邯�ǂ���͌��ɖ߂��Ȃ��B
(defun properties-unescape-property (str)
  (setf str (substitute-string str "\\\\\n[ \t]*" ""))
  (setf str (string-trim "[ \t\r\f\n]" str))
  (setf str (substitute-string str "\\\\\\([\"\\' !#:=]\\)" "\\1")))

(defun properties-escape-csv (str)
  (setf str (substitute-string str "\"" "\"\""))
  (if (string-match "[\n\r\",]" str)
      (concat "\"" str "\"")
    str))

;; ----------------------------------------------------------------------
;; �s�̃R�����g���g�O��

(defun properties-comment-toggle-line ()
  "properties-mode: �s�̃R�����g���g�O��"
  (interactive "*")
  (save-excursion
    (let ((start (progn (goto-bol) (point)))
          (end (progn (goto-eol) (point))))
      (if (properties-comment-line)
          (properties-uncomment-region start end)
        (properties-comment-region start end)))))

;; ----------------------------------------------------------------------
;; ���[�W�������R�����g�A�E�g

(defun properties-comment-region (start end)
  "properties-mode: ���[�W�������R�����g"
  (interactive "*r")
  (if (< end start) (rotatef start end))

  (save-excursion
    (save-restriction
      (narrow-to-region (progn (goto-char end) (goto-eol) (point))
                        (progn (goto-char start) (goto-bol) (point)))
      (loop
        (goto-bol)
        (insert comment-start)
        (goto-eol)
        (insert comment-end)
        (unless (forward-line 1) (return)))
      )))

;; ----------------------------------------------------------------------
;; ���[�W�������R�����g����

(defun properties-uncomment-region (start end)
  "properties-mode: ���[�W�������R�����g"
  (interactive "*r")
  (if (< end start) (rotatef start end))

  (save-excursion
    (save-restriction
      (narrow-to-region (progn (goto-char end) (goto-eol) (point))
                        (progn (goto-char start) (goto-bol) (point)))
      (loop
        (goto-bol)
        (if (scan-buffer comment-start :regexp t)
            (delete-region (match-beginning 0) (match-end 0)))
        (goto-eol)
        (if (scan-buffer comment-end :regexp t :reverse t)
            (delete-region (match-beginning 0) (match-end 0)))
        (unless (forward-line 1) (return)))
      )))

;; ----------------------------------------------------------------------

(defun properties-electric-insert (&optional (arg 1))
  (interactive "*p")
  (self-insert-command arg)
  (backward-char)
  (properties-indent-line)
  (forward-char))

(defun properties-newline-and-indent (&optional (arg 1))
  (interactive "*p")
  (insert #\LFD arg)
  (properties-indent-line))

;; indent
(defun properties-indent-line ()
  (interactive "*")
  (let ((column (calc-properties-indent)))
    (when (integerp column)
      (smart-indentation column)))
  t)

(defun properties-continued-line ()
  "�p���s���ǂ���"
  (save-excursion
    (if (not (forward-line -1))
        (return-from properties-continued-line nil))
    (let ((limit (progn (goto-eol) (point))))
      (goto-bol)
      (and (scan-buffer "\\(\\\\+\\)[ \t]*$" :regexp t :limit limit)
           (oddp (length (match-string 1)))))))

(defun properties-previous-line ()
  "�O�̍s�܂Ŗ߂�"
  (while (forward-line -1)
    (unless (or (properties-space-line)
                (properties-comment-line)
                (properties-continued-line))
      (return-from properties-previous-line t))))

(defun properties-space-line ()
  "��s���ǂ���"
  (save-excursion
    (goto-bol)
    (and (not (properties-continued-line))
         (looking-at "[ \t]*$"))))

(defun properties-comment-line ()
  "�R�����g�s���ǂ���"
  (save-excursion
    (goto-bol)
    (looking-at "^[ \t]*[#!]")))

(defun calc-properties-indent ()
  "�C���f���g���鐔�𐔂���"
  (let ((column 0)
        (continued-line-p (properties-continued-line)))
    (save-excursion
      ; �O�̍s�𒲂ׂ�
      (when (properties-previous-line)
        (goto-bol)
        (when continued-line-p
          ;; �O�̍s�� value �̃C���f���g
          (scan-buffer (concat *properties-key-pattern*
                               "\\(" *properties-separator-pattern* "\\)?")
                       :regexp t :tail t)
          ;; value ���Ȃ������� *properties-indent-level*
          (if (looking-at "\\\\$")
              (incf column *properties-indent-level*)
            (setf column (current-column)))
          )))
    ;; �C���f���g�ς݂ŃJ�[�\���̎��̕����� \ �Ȃ�O�̍s�� \ �Ƃ��킹��B
    (when (and (= column (properties-current-indent))
               (looking-at "[ \t]*\\\\[ \t]*$"))
      (properties-indent-backslash))
    column
    ))

(defun properties-indent-backslash ()
  (let ((col 0)
        (current (save-excursion (skip-chars-forward " \t") (current-column))))
    (save-excursion
      (when (and (properties-continued-line)
                 (properties-previous-line))
        (goto-bol)
        (when (scan-buffer "\\\\[ \t]*$" :regexp t)
          (setf col (current-column)))))
    (unless (zerop col)
      (if (< col current)
          (delete-region (point) (+ (point) (- current col)))
        (insert (make-sequence 'string (- col current) :initial-element #\SPC))))))

(defun properties-current-indent ()
  (save-excursion
    (goto-bol)
    (skip-chars-forward " \t")
    (current-column)))

;; ----------------------------------------------------------------------
;; key �̈ꗗ: list-function �ŕ\�������
(defun properties-build-summary-of-functions ()
  (let ((result nil))
    (save-excursion
      (goto-char (point-min))
      (while (scan-buffer *properties-key-pattern* :regexp t :tail t)
        (push (list (current-line-number) (match-string 1)) result)))
    (nreverse result)
    ))

; mode�̎��s
(defun properties-mode ()
  "properties-mode"
  (interactive)
  (kill-all-local-variables)
  (setq mode-name "Properties")
  (setq buffer-mode 'properties-mode)
  (use-syntax-table *properties-mode-syntax-table*)
  (use-keymap *properties-mode-map*)

  (make-local-variable 'paragraph-start)
  (setq paragraph-start "^$\\|\f")
  (make-local-variable 'paragraph-separate)
  (setq paragraph-separate paragraph-start)

  ; indent
  (make-local-variable 'mode-specific-indent-command)
  (setq mode-specific-indent-command 'properties-indent-line)
  (make-local-variable 'mode-newline-and-indent-command)
  (setq mode-newline-and-indent-command 'properties-newline-and-indent)

  ; list of key
  (make-local-variable 'build-summary-function)
  (setf build-summary-function 'properties-build-summary-of-functions)

  ; keyword
  (make-local-variable 'regexp-keyword-list)
  (setq regexp-keyword-list *properties-regexp-keyword-list*)

  ; comment
  (setq comment-start "# " comment-end "")
  (setq comment-start-skip "[#!]+[ \t]*")
  (setq comment-indent-function 'calc-properties-indent)
  (when *properties-comment-column*
    (setq comment-column *properties-comment-column*))

  (make-variable-buffer-local '*before-save-buffer-hook*)
  (add-hook '*before-save-buffer-hook* 'properties-save-buffer)

  ; ascii2native ����
  (properties-on-load)

  ; modified hook
;  (enable-post-buffer-modified-hook t)
;  (add-hook 'post-buffer-modified-hook 'properties-buffer-modified-hook)

  ; �t�b�N�̎��s
  (run-hooks '*properties-mode-hook*))