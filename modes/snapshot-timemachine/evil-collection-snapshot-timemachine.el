;;; evil-collection-snapshot-timemachine.el --- Bindings for `snapshot-timemachine' -*- lexical-binding: t -*-

;; Author: William Carroll <wpcarro@gmail.com>
;; Maintainer: James Nguyen <james@jojojames.com>
;; Pierre Neidhardt <mail@ambrevar.xyz>
;; URL: https://github.com/emacs-evil/evil-collection
;; Version: 0.0.1
;; Package-Requires: ((emacs "25.1"))
;; Keywords: evil, git, tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; Evil keybindings for `snapshot-timemachine' that conform to the principles
;; outlines in evil-collection

;;; Code:
(require 'evil-collection)
(require 'snapshot-timemachine nil t)

(defvar snapshot-timemachine-mode-map)
(defconst evil-collection-snapshot-timemachine-map '(snapshot-timemachine-mode-map))
(defvar snapshot-timeline-mode-map)
(defconst evil-collection-snapshot-timeline-map '(snapshot-timeline-mode-map))

;;;###autoload
(defun evil-collection-snapshot-timemachine-setup ()
  "Setup `evil' keybindings for `snapshot-timemachine'."
  (evil-define-minor-mode-key 'normal 'snapshot-timemachine-mode
    "\C-k" 'snapshot-timemachine-show-prev-interesting-snapshot
    "\C-j" 'snapshot-timemachine-show-next-interesting-snapshot
    "q"   'snapshot-timemachine-quit)
  (evil-define-minor-mode-key 'normal 'snapshot-timeline-mode
    "RET" 'snapshot-timeline-show-diff
    "<S-return>" 'snapshot-timeline-view-snapshot
    "a"   'snapshot-timeline-mark-as-A
    "b"   'snapshot-timeline-mark-as-B
    "d"   'snapshot-timeline-show-diff-A-B
    "q"   'snapshot-timemachine-quit
    "j"   'snapshot-timeline-goto-next-snapshot
    "k"   'snapshot-timeline-goto-prev-snapshot
    "J"   'snapshot-timeline-goto-next-interesting-snapshot
    "K"   'snapshot-timeline-goto-prev-interesting-snapshot
    "u"   'snapshot-timeline-unmark
    "U"   'snapshot-timeline-unmark-all
    "m"   'snapshot-timeline-emerge-A-B
    "d"   'snapshot-timeline-ediff-A-B
    "<"   'tabulated-list-narrow-current-column
    ">"   'tabulated-list-widen-current-column))

(provide 'evil-collection-git-timemachine)
;;; evil-collection-git-timemachine.el ends here
